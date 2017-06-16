package foo.bar.google;

import java.io.IOException;

import org.json.JSONObject;
import org.jsoup.Jsoup;


public class VerifyRecaptcha {

	public static final String url = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secret = "6LfJciUUAAAAAD1JDz0Sr6VE_M3oGlK1hPXfjH05";
	private final static String USER_AGENT = "Mozilla/5.0";


	public static boolean verify(String gRecaptchaResponse) throws IOException {
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}

		try{

			String response = Jsoup.connect(url)
								.userAgent(USER_AGENT)
								.header("Accept-Language", "en-US,en;q=0.5")
								.header("Accept", "text/javascript")
								.ignoreContentType(true)						// avoid org.jsoup.UnsupportedMimeTypeException
								.data("secret", secret)
								.data("response", gRecaptchaResponse)
								.post()
								.body()
								.text();

			JSONObject root = new JSONObject(response);

			return root.getBoolean("success");

		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}


}
