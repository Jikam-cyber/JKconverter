<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fileName = (String) request.getAttribute("fileName");
    if (fileName == null) fileName = (String) session.getAttribute("fileName");
    boolean isPdf = (fileName != null && fileName.toLowerCase().endsWith(".pdf"));
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Succès | JKconverter</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap');
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; }
        .glass-card { background: rgba(30, 41, 59, 0.7); backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.1); }
    </style>
</head>
<body class="min-h-screen flex flex-col">
    <nav class="p-6 border-b border-slate-800 bg-slate-900/50">
        <div class="max-w-7xl mx-auto flex justify-between">
            <a href="${pageContext.request.contextPath}/" class="text-2xl font-black italic"><span class="text-red-500">JK</span>CONVERTER</a>
        </div>
    </nav>

    <main class="flex-grow flex items-center justify-center p-4">
        <div class="max-w-xl w-full">
            <div class="glass-card rounded-[3rem] p-12 text-center shadow-2xl">
                <div class="w-20 h-20 bg-green-500/20 rounded-3xl flex items-center justify-center mx-auto mb-6">
                    <i class="fas fa-check text-3xl text-green-400"></i>
                </div>
                
                <h2 class="text-3xl font-black uppercase italic mb-2">Fichier <span class="text-red-500">Prêt</span></h2>
                <p class="text-slate-400 text-[10px] font-bold uppercase tracking-widest mb-10">Conversion réussie</p>

                <div class="bg-slate-900/80 rounded-2xl p-6 mb-10 border border-slate-700 text-left flex items-center gap-4">
                    <i class="fas fa-file-alt text-2xl text-red-500"></i>
                    <div class="overflow-hidden">
                        <p class="text-white font-bold truncate"><%= fileName %></p>
                    </div>
                </div>

                <div class="grid gap-4 mb-10">
                    <% if (isPdf) { %>
                        <a href="${pageContext.request.contextPath}/uploads/<%= fileName %>" target="_blank" class="bg-white text-slate-900 font-black py-4 rounded-xl uppercase text-[10px] tracking-widest flex items-center justify-center gap-2">
                            <i class="fas fa-eye"></i> Afficher le document
                        </a>
                    <% } %>
                    <a href="${pageContext.request.contextPath}/uploads/<%= fileName %>" download class="bg-red-600 text-white font-black py-4 rounded-xl uppercase text-[10px] tracking-widest flex items-center justify-center gap-2 shadow-lg shadow-red-600/30">
                        <i class="fas fa-download"></i> Télécharger maintenant
                    </a>
                </div>

                <div class="flex gap-4 pt-8 border-t border-slate-800">
                    <a href="https://wa.me/?text=Regarde mon fichier : <%= fileName %>" target="_blank" class="flex-1 py-4 bg-[#25D366]/10 text-[#25D366] rounded-xl border border-[#25D366]/20 hover:bg-[#25D366] hover:text-white transition-all"><i class="fab fa-whatsapp text-xl"></i></a>
                    <a href="https://t.me/share/url?url=JKconverter&text=Fichier converti" target="_blank" class="flex-1 py-4 bg-[#0088cc]/10 text-[#0088cc] rounded-xl border border-[#0088cc]/20 hover:bg-[#0088cc] hover:text-white transition-all"><i class="fab fa-telegram-plane text-xl"></i></a>
                </div>
            </div>

            <div class="text-center mt-8">
                <a href="${pageContext.request.contextPath}/" class="text-slate-500 hover:text-white font-black uppercase text-[10px] tracking-[0.3em] transition-all">
                    <i class="fas fa-arrow-left mr-2"></i> Retour à l'accueil
                </a>
            </div>
        </div>
    </main>
</body>
</html>