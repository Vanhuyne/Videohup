package serviceImpl;

import javax.servlet.ServletContext;

import entity.User;
import service.EmailService;
import utils.SendEmailUtils;

public class EmailServiceImpl implements EmailService {
	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to VideoApp";
	private static final String EMAIL_FORGOT_PASSWORD = "VideoApp - New Password";
	private static final String EMAIL_SHARE_VIDEOS = "VideoApp - Another has just send the video to you!!!";

	@Override
	public void sendMail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear " + recipient.getUsername() + " hope you have best time!!";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getUsername() + ", your new password is here: " + recipient.getPassword();
				break;
			case "share":
				subject = EMAIL_SHARE_VIDEOS;
				content = recipient.getUsername() + "has just send the video for you!";
				break;
			default:
				subject = "Onflix Project";
				content = "This email is not exsist! Check it!!";
			}
			SendEmailUtils.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
