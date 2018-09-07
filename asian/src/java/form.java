
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import storage.User;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.stream.FileImageInputStream;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import java.io.File;
/**
 *
 * @author ryuuk
 */
@WebServlet(urlPatterns = { "/form" })
public class form extends HttpServlet {

        String pathToFile="/home/ryuuk/Academic/Cloud Computing/AWS/user.txt";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String district = request.getParameter("district");
            String location = request.getParameter("location");
            String name = request.getParameter("name");
            String phoneno = request.getParameter("phoneno");
            String[] items = request.getParameterValues("requested");
            String date = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date());
            String requested = "";

            for (int i = 0; i < items.length - 1; i++) {
                requested += items[i] + ",";
            }
            requested += items[items.length - 1];

            User newUser = new User(district, location, name, phoneno, requested, date);

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet form</title>");
            out.println("</head>");
            out.println("<body>");
            try {

                FileInputStream fin = new FileInputStream(pathToFile);
                ObjectInputStream oi = new ObjectInputStream(fin);
                ArrayList<User> userList = (ArrayList<User>) oi.readObject();
                out.println("<h1>Size :" + userList.size() + "</h1>");
                userList.add(newUser);
                oi.close();
                fin.close();
                FileOutputStream fout = new FileOutputStream(pathToFile);
                ObjectOutputStream oo = new ObjectOutputStream(fout);
                oo.writeObject(userList);
                oo.close();
                fout.close();

                writeToS3();

            } catch (Exception e) {
                out.println("<h1>" + e + "</h1>");
                ArrayList<User> userList = new ArrayList<User>();
                userList.add(newUser);
                FileOutputStream fout = new FileOutputStream(pathToFile);
                ObjectOutputStream oo = new ObjectOutputStream(fout);
                oo.writeObject(userList);
                writeToS3();
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void writeToS3() {
        BasicAWSCredentials creds = null;

        String bucketName = "keralafloodhelprequest";

        creds = new BasicAWSCredentials("AKIAI5T76BMJ2GXVLHMQ", "afhvRcRoOfDV3UxXHs+sCw3zZoMfYNRBim2Sz+Re");
        String path = pathToFile;
        String foldername = "keralaflood";
        AmazonS3 s3 = AmazonS3Client.builder().withRegion(Regions.US_EAST_1)
                .withCredentials(new AWSStaticCredentialsProvider(creds)).build();
        PutObjectResult res = s3.putObject(new PutObjectRequest(bucketName, foldername, new File(path)));
        System.out.println(res.toString());
        
        
        File filedel = new File ("/home/ryuuk/Academic/Cloud Computing/AWS/user.txt");
        filedel.delete();
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
