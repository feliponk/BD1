/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.netbeans.saas.flickr;

import java.io.IOException;
import org.netbeans.saas.RestConnection;
import org.netbeans.saas.RestResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FlickrPhotoService Service
 *
 * @author felipe
 */
public class FlickrPhotoService {

    /**
     * Creates a new instance of FlickrPhotoService
     */
    public FlickrPhotoService() {
    }
    
    private static void sleep(long millis) {
        try {
            Thread.sleep(millis);
        } catch (Throwable th) {
        }
    }

    /**
     *
     * @param request
     * @param response
     * @param groupId
     * @return an instance of RestResponse
     */
    public static RestResponse urlsGetGroup(HttpServletRequest request, HttpServletResponse response, String groupId) throws IOException {
        String method = "flickr.urls.getGroup";
        FlickrPhotoServiceAuthenticator.login(request, response);
        String apiKey = FlickrPhotoServiceAuthenticator.getApiKey(request, response);
        String authToken = FlickrPhotoServiceAuthenticator.getAuthToken(request, response);
        String apiSig = FlickrPhotoServiceAuthenticator.sign(new String[][]{{"api_key", apiKey}, {"group_id", groupId}, {"method", method}, {"auth_token", authToken}});
        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{{"api_key", "" + apiKey + ""}, {"group_id", groupId}, {"method", method}, {"auth_token", authToken}, {"api_sig", apiSig}};
        RestConnection conn = new RestConnection("http://api.flickr.com/services/rest", pathParams, queryParams);
        sleep(1000);
        return conn.get(null);
    }

    /**
     *
     * @param request
     * @param response
     * @param tickets
     * @return an instance of RestResponse
     */
    public static RestResponse photosUploadCheckTickets(HttpServletRequest request, HttpServletResponse response, String tickets) throws IOException {
        String method = "flickr.photos.upload.checkTickets";
        FlickrPhotoServiceAuthenticator.login(request, response);
        String apiKey = FlickrPhotoServiceAuthenticator.getApiKey(request, response);
        String authToken = FlickrPhotoServiceAuthenticator.getAuthToken(request, response);
        String apiSig = FlickrPhotoServiceAuthenticator.sign(new String[][]{{"api_key", apiKey}, {"tickets", tickets}, {"method", method}, {"auth_token", authToken}});
        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{{"api_key", "" + apiKey + ""}, {"tickets", tickets}, {"method", method}, {"auth_token", authToken}, {"api_sig", apiSig}};
        RestConnection conn = new RestConnection("http://api.flickr.com/services/rest", pathParams, queryParams);
        sleep(1000);
        return conn.get(null);
    }
}
