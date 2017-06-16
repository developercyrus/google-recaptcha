package foo.bar.google;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println("gRecaptchaResponse="+ gRecaptchaResponse);
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);

		if (verify) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/success.jsp");
			requestDispatcher.forward(request, response);
		} else {
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out = response.getWriter();
			out.println("<font color=red>You missed the reCaptcha.</font>");
			requestDispatcher.include(request, response);
		}
	}
}