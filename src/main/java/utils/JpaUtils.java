package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	private static EntityManagerFactory factory;

	// connect db
	static public EntityManager getEntityManager() {
		try {
			if (factory == null || !factory.isOpen()) {
				factory = Persistence.createEntityManagerFactory("asm2");
				System.out.println("Succed");
			}
			return factory.createEntityManager();
		} catch (Exception e) {
			System.err.println("Lỗi khi kết nối đến cơ sở dữ liệu: " + e.getMessage());
			e.printStackTrace();
			return null; // Trả về null nếu có lỗi xảy ra
		}
	}

	// close db
	static public void shutdown() {
		if (factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}

	public static void main(String[] args) {
		JpaUtils.getEntityManager();
		JpaUtils.shutdown();
	}
	
	
}
