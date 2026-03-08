<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion | JKconverter Dark</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-[#0f172a] text-white flex flex-col min-h-screen">

<nav class="bg-[#1e293b] border-b border-slate-700 py-4 px-6 shadow-xl">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
        <a href="${pageContext.request.contextPath}/" class="text-2xl font-black flex items-center tracking-tighter">
            <span class="text-red-500 italic">JK</span><span class="text-white">CONVERTER</span>
        </a>
    </div>
</nav>

<div class="flex-grow flex items-center justify-center p-6">
    <div class="bg-[#1e293b] w-full max-w-md p-10 rounded-2xl shadow-2xl border border-slate-700">
        <h2 class="text-3xl font-black mb-8 text-center uppercase tracking-widest">Connexion</h2>
        
        <form class="space-y-6">
            <div>
                <label class="block text-xs font-bold text-slate-500 uppercase mb-2">Email</label>
                <input type="email" class="w-full bg-[#0f172a] border border-slate-700 rounded-lg p-3 outline-none focus:border-red-500 transition" placeholder="votre@email.com">
            </div>
            <div>
                <label class="block text-xs font-bold text-slate-500 uppercase mb-2">Mot de passe</label>
                <input type="password" class="w-full bg-[#0f172a] border border-slate-700 rounded-lg p-3 outline-none focus:border-red-500 transition" placeholder="••••••••">
            </div>
            <button type="submit" class="w-full bg-red-600 py-4 rounded-xl font-black uppercase tracking-widest hover:bg-red-700 transition shadow-lg">Se connecter</button>
        </form>
        
        <p class="mt-8 text-center text-sm text-slate-400">
            Pas encore de compte ? <a href="register" class="text-red-500 font-bold hover:underline">S'inscrire</a>
        </p>
    </div>
</div>

</body>
</html>