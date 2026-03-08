<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>S'inscrire | JKconverter</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-50 dark:bg-slate-900 min-h-screen flex items-center justify-center px-4">

    <div class="max-w-sm w-full bg-white dark:bg-slate-800 p-10 rounded-3xl shadow-2xl border border-gray-100 dark:border-gray-700">
        <div class="text-center mb-8">
            <a href="/" class="inline-block mb-4 text-brand text-4xl"><i class="fas fa-user-plus"></i></a>
            <h2 class="text-2xl font-bold text-slate-900 dark:text-white">Créer un compte</h2>
            <p class="text-gray-500 text-sm">Rejoignez la communauté JKconverter</p>
        </div>

        <form action="registerAction" method="POST" class="space-y-5">
            <div>
                <label class="block text-sm font-bold text-gray-700 dark:text-gray-300 mb-2">Nom d'utilisateur</label>
                <input type="text" name="username" required class="w-full p-4 rounded-xl border border-gray-300 dark:bg-slate-900 dark:border-gray-600 dark:text-white focus:ring-2 focus:ring-brand outline-none" placeholder="Ex: Jean Dupont">
            </div>
            <div>
                <label class="block text-sm font-bold text-gray-700 dark:text-gray-300 mb-2">Mot de passe</label>
                <input type="password" name="password" required class="w-full p-4 rounded-xl border border-gray-300 dark:bg-slate-900 dark:border-gray-600 dark:text-white focus:ring-2 focus:ring-brand outline-none" placeholder="••••••••">
            </div>
            <button type="submit" class="w-full bg-brand text-white font-bold py-4 rounded-xl shadow-lg hover:bg-blue-900 transition-all">
                S'inscrire gratuitement
            </button>
        </form>
        
        <div class="mt-6 text-center">
            <a href="/" class="text-sm text-gray-500 hover:text-brand underline">Retour à l'accueil</a>
        </div>
    </div>

</body>
</html>