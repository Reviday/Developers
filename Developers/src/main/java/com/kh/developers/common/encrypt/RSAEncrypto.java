package com.kh.developers.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import org.springframework.stereotype.Component;

@Component
public class RSAEncrypto implements MyEncrypt{

	//key 값을 변수로 보관
	//key가 2개 존재함
	private PublicKey publicKey;
	private PrivateKey privateKey;
	
	public RSAEncrypto() {
		String path=this.getClass().getResource("/").getPath();
		path=path.substring(0,path.lastIndexOf("/classes"));
		File f=new File(path+"/keys.bs");
		if(f.exists()) {
			try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f))){
				Map<String,Object> keys=(Map)ois.readObject();
				publicKey=(PublicKey)keys.get("public");
				privateKey=(PrivateKey)keys.get("private");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			if(publicKey==null||privateKey==null) {
				try {
					getKey();
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	private void getKey() throws NoSuchAlgorithmException {
		SecureRandom ser=new SecureRandom();
		KeyPairGenerator keygen;
		keygen=KeyPairGenerator.getInstance("RSA");
		keygen.initialize(2048,ser);
		KeyPair keypair=keygen.generateKeyPair();
		publicKey=keypair.getPublic(); //공개키 생성
		privateKey=keypair.getPrivate(); //비밀키 생성
		/* 암호화키 생성 끝 */
		String path=this.getClass().getResource("/").getPath();
		path=path.substring(0,path.lastIndexOf("/target"));
		File f=new File(path+"/src/main/webapp/WEB-INF/keys.bs");
		try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f))) {
			Map<String, Object> keys=new HashMap<String, Object>();
			keys.put("public", publicKey);
			keys.put("private", privateKey);
			oos.writeObject(keys);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String decrypt(String msg) throws Exception {
		Cipher cipher=Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] enc=Base64.getDecoder().decode(msg.getBytes());
		byte[] decrypt=cipher.doFinal(enc);
		return new String(decrypt,"UTF-8");
	}
	
	@Override
	public String encrypt(String msg) throws Exception {
		Cipher cipher=Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] encrypt=cipher.doFinal(msg.getBytes());
		return Base64.getEncoder().encodeToString(encrypt);
	}
}
