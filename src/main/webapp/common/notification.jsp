<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<div class="suc-fade-box" style="position: fixed; top: 10vh; left: 50%; transform: translate(-50%, -50%); background-color: rgb(234, 239, 248);
    padding: 1rem 2rem; border: 3px dotted salmon; z-index: 101; transition: all 1s; pointer-events: none; opacity: 0;">
        <span style="display:inline-block; background-color: #75C32C; width: 1.35rem; height: 1.4rem; text-align: center;color: white; border-radius: 50%;
        font-size: 1rem; margin-right: 1rem;"><i class="fa-solid fa-check"></i></span>
        <span class="success-ele" style="font-family: inherit; font-size: 1rem; color: #2b2f38;">Successful!</span>
    </div>
    <div class="fail-fade-box" style="position: fixed; top: 10vh; left: 50%; transform: translate(-50%, -50%); background-color: rgb(234, 239, 248);
    padding: 1rem 2rem; border: 3px dotted salmon; z-index: 101; transition: all 1s; pointer-events: none; opacity: 0;">
        <span style="display:inline-block; background-color: #be2127; width: 1.35rem; height: 1.4rem; text-align: center;color: white; border-radius: 50%;
        font-size: 1rem; margin-right: 1rem;"><i class="fa-solid fa-exclamation"></i></span>
        <span class="fail-ele" style="font-family: inherit; font-size: 1rem; color: #2b2f38;">Failed!</span>
    </div>
</body>
</html>