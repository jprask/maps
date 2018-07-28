<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
</head>

<body>
    <footer class="page-footer deep-purple darken-4">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="white-text">Maps App</h5>
                    <p class="grey-text text-lighten-3">
                        Projeto de valiação para contratação - Megatecnologia.
                        <br> Desenvolvido utilizando o framework Spring (MVC), Hibernate, JSP, MySQL, Google Maps API e outros.
                    </p>
                </div>
                <div class="col l4 offset-l2 s12">
                    <h5 class="white-text">Links</h5>
                    <ul>
                        <li>
                            <a class="grey-text text-lighten-3" href="http://megatecnologia-si.com.br/">
                                <img class="responsive-img" src="<c:url value="/assets/img/mega-logo.png" />" alt="" width="160" height="75">
                            </a>
                        </li>
                        <br>
                        <li>
                            <a class="grey-text text-lighten-3" href="http://www.universidadefranciscana.edu.br/site">
                                <img class="responsive-img" src="<c:url value="/assets/img/ufn-logo.png" />"  alt="" width="160" height="75">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2018 jprask
            </div>
        </div>
    </footer>
</body>
</html>
