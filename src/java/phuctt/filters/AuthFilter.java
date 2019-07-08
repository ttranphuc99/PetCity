/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thien Phuc
 */
public class AuthFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    private final List<String> guest, admin, member;

    public AuthFilter() {
        guest = new ArrayList<>();
        guest.add("login");
        guest.add("login.action");
        guest.add("''");
        guest.add("");
        guest.add("signup");
        guest.add("signup.action");
        guest.add("welcome");
        guest.add("welcome.action");
        guest.add("loadAccessoryDetail");
        guest.add("loadAccessoryDetail.action");
        guest.add("addAccessoryToCart");
        guest.add("addAccessoryToCart.action");
        guest.add("viewAccessoryCart");
        guest.add("viewAccessoryCart.action");
        guest.add("removeAccessoryCart");
        guest.add("removeAccessoryCart.action");
        guest.add("updateAccessoryCart");
        guest.add("updateAccessoryCart.action");
        guest.add("loadListService");
        guest.add("loadListService.action");
        guest.add("viewServiceDetail");
        guest.add("viewServiceDetail.action");
        guest.add("loadExactlyContent");
        guest.add("loadExactlyContent.action");
        guest.add("ajaxLoadMoreAccessory");
        guest.add("ajaxLoadMoreAccessory.action");
        guest.add("searchNameAccessory");
        guest.add("searchNameAccessory.action");

        admin = new ArrayList<>();
        admin.add("addAccessory");
        admin.add("addAccessory.action");
        admin.add("addAdmin");
        admin.add("addAdmin.action");
        admin.add("addService");
        admin.add("addService.action");
        admin.add("addStaff");
        admin.add("addStaff.action");
        admin.add("changePassword");
        admin.add("changePassword.action");
        admin.add("adminEditProfile");
        admin.add("adminEditProfile.action");
        admin.add("adminViewProfile");
        admin.add("adminViewProfile.action");
        admin.add("loadCategoryType");
        admin.add("loadCategoryType.action");
        admin.add("loadStaff");
        admin.add("loadStaff.action");
        admin.add("logout");
        admin.add("logout.action");
        admin.add("adminViewListAccessory");
        admin.add("adminViewListAccessory.action");
        admin.add("updateAccessory");
        admin.add("updateAccessory.action");
        admin.add("deleteAccessory");
        admin.add("deleteAccessory.action");
        admin.add("banUser");
        admin.add("banUser.action");
        admin.add("activeUser");
        admin.add("activeUser.action");
        admin.add("availableStaff");
        admin.add("availableStaff.action");
        admin.add("updateStaff");
        admin.add("updateStaff.action");
        admin.add("deleteStaff");
        admin.add("deleteStaff.action");
        admin.add("updateService");
        admin.add("updateService.action");
        admin.add("deleteService");
        admin.add("deleteService.action");
        admin.add("viewListAccessoryInvoice");
        admin.add("viewListAccessoryInvoice.action");
        admin.add("updateStatusAccessoryInvoice");
        admin.add("updateStatusAccessoryInvoice.action");
        admin.add("adminViewAccessoryInvoiceDetail");
        admin.add("adminViewAccessoryInvoiceDetail.action");
        admin.add("viewListServiceInvoice");
        admin.add("viewListServiceInvoice.action");
        admin.add("viewDetailServiceInvoice");
        admin.add("viewDetailServiceInvoice.action");
        admin.add("updateInvoiceService");
        admin.add("updateInvoiceService.action");
        admin.add("cancelInvoiceService");
        admin.add("cancelInvoiceService.action");
        admin.add("adminViewListPet");
        admin.add("adminViewListPet.action");
        admin.add("loadDashboard");
        admin.add("loadDashboard.action");

        member = new ArrayList<>();
        member.add("logout");
        member.add("logout.action");
        member.add("welcome");
        member.add("welcome.action");
        member.add("loadAccessoryDetail");
        member.add("loadAccessoryDetail.action");
        member.add("");
        member.add("''");
        member.add("addAccessoryToCart");
        member.add("addAccessoryToCart.action");
        member.add("viewAccessoryCart");
        member.add("viewAccessoryCart.action");
        member.add("removeAccessoryCart");
        member.add("removeAccessoryCart.action");
        member.add("updateAccessoryCart");
        member.add("updateAccessoryCart.action");
        member.add("loadProfile");
        member.add("loadProfile.action");
        member.add("updateProfile");
        member.add("updateProfile.action");
        member.add("loadCategoryType");
        member.add("loadCategoryType.action");
        member.add("addPet");
        member.add("addPet.action");
        member.add("viewListPet");
        member.add("viewListPet.action");
        member.add("deletePet");
        member.add("deletePet.action");
        member.add("viewPetDetail");
        member.add("viewPetDetail.action");
        member.add("updatePet");
        member.add("updatePet.action");
        member.add("viewListAccessoryInvoice");
        member.add("viewListAccessoryInvoice.action");
        member.add("cancelInvoiceAccessory");
        member.add("cancelInvoiceAccessory.action");
        member.add("viewAccessoryCartDetail");
        member.add("viewAccessoryCartDetail.action");
        member.add("loadListService");
        member.add("loadListService.action");
        member.add("viewServiceDetail");
        member.add("viewServiceDetail.action");
        member.add("bookService");
        member.add("bookService.action");
        member.add("viewListServiceInvoice");
        member.add("viewListServiceInvoice.action");
        member.add("viewDetailServiceInvoice");
        member.add("viewDetailServiceInvoice.action");
        member.add("cancelInvoiceService");
        member.add("cancelInvoiceService.action");
        member.add("loadExactlyContent");
        member.add("loadExactlyContent.action");
        member.add("ajaxLoadMoreAccessory");
        member.add("ajaxLoadMoreAccessory.action");
        member.add("searchNameAccessory");
        member.add("searchNameAccessory.action");
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        if (uri.contains("/css/") || uri.contains("/js/") || uri.contains("/img/") || uri.contains("/images/")) {
            chain.doFilter(request, response);
        } else {
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            System.out.println("uri: " + uri);
            System.out.println("resource: " + resource);
            System.out.println(admin.contains(resource));

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("USERNAME") == null) {
                //guest
                if (guest.contains(resource) || uri.contains("publicPage")) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("/PetCity/");
                }
            } else {
                String role = (String) session.getAttribute("ROLE");

                if (role != null) {
                    if (role.equals("admin")) {
                        if (admin.contains(resource) || uri.contains("admin")) {
                            chain.doFilter(request, response);
                        } else {
                            res.sendRedirect("/PetCity/loadDashboard");
                        }
                    } else if (role.equals("member")) {
                        if (member.contains(resource) || uri.contains("member") || uri.contains("publicPage")) {
                            if (resource.equals("login.jsp") || resource.equals("signup.jsp")) {
                                res.sendRedirect("/PetCity/");
                            } else {
                                chain.doFilter(request, response);
                            }
                        } else {
                            res.sendRedirect("/PetCity/");
                        }
                    } else {
                        res.sendRedirect("/PetCity/");
                    }
                } else {
                    res.sendRedirect("/PetCity/");
                }
            }
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
