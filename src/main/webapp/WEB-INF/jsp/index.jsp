<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userName = (String) session.getAttribute("userName");
    boolean isConnected = (userName != null);
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JKconverter | Cloud Conversion</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap');
        body { font-family: 'Inter', sans-serif; background-color: #0f172a; scroll-behavior: smooth; color: #f8fafc; }
        
        .glass-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease;
        }

        .glass-card:hover {
            border-color: rgba(239, 68, 68, 0.3);
            transform: translateY(-5px);
        }

        .row-hover:hover { background: rgba(255, 255, 255, 0.03); }

        /* Animation de l'arrière-plan */
        .glow {
            position: fixed;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(239, 68, 68, 0.05) 0%, transparent 70%);
            z-index: -1; top: 20%; left: 10%;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col">
    <div class="glow"></div>

    <nav class="sticky top-0 z-50 glass-card border-b border-slate-800 px-8 py-5">
        <div class="max-w-7xl mx-auto flex justify-between items-center">
            <a href="${pageContext.request.contextPath}/" class="text-2xl font-black tracking-tighter italic uppercase">
                <span class="text-red-500">JK</span>CONVERTER
            </a>

            <div class="flex gap-8 items-center font-black text-[10px] uppercase tracking-[0.2em]">
                <% if (!isConnected) { %>
                    <a href="login.jsp" class="text-slate-400 hover:text-white transition">Connexion</a>
                    <a href="register.jsp" class="bg-red-600 text-white px-6 py-2.5 rounded-xl hover:bg-red-700 transition shadow-lg shadow-red-600/20">S'inscrire</a>
                <% } else { %>
                    <span class="text-red-500"><i class="fas fa-user-circle mr-2"></i><%= userName %></span>
                    <a href="LogoutServlet" class="text-slate-500 hover:text-white transition"><i class="fas fa-power-off"></i></a>
                <% } %>
            </div>
        </div>
    </nav>

    <main class="max-w-6xl mx-auto px-6 pt-20 pb-16 text-center">
        <div class="mb-16">
            <h1 class="text-6xl font-black text-white italic uppercase tracking-tighter mb-4">
                Convertissez en <span class="text-red-500 underline decoration-white/10">un éclair</span>
            </h1>
            <p class="text-slate-500 text-xs font-black uppercase tracking-[0.5em]">Technologie Cloud Haute Performance</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-24">
            <div onclick="openModal('PDF to Word')" class="group glass-card p-12 rounded-[3rem] cursor-pointer border-t-4 border-blue-500/50">
                <div class="w-20 h-20 bg-blue-500/10 rounded-3xl flex items-center justify-center mx-auto mb-8 group-hover:bg-blue-500/20 transition-colors">
                    <i class="fas fa-file-word text-4xl text-blue-500"></i>
                </div>
                <h3 class="text-xl font-black text-white italic uppercase mb-3">PDF en Word</h3>
                <p class="text-slate-500 text-[10px] font-bold uppercase tracking-widest">Sortie : .docx</p>
            </div>

            <div onclick="openModal('PDF to Excel')" class="group glass-card p-12 rounded-[3rem] cursor-pointer border-t-4 border-green-500/50">
                <div class="w-20 h-20 bg-green-500/10 rounded-3xl flex items-center justify-center mx-auto mb-8 group-hover:bg-green-500/20 transition-colors">
                    <i class="fas fa-file-excel text-4xl text-green-500"></i>
                </div>
                <h3 class="text-xl font-black text-white italic uppercase mb-3">PDF en Excel</h3>
                <p class="text-slate-500 text-[10px] font-bold uppercase tracking-widest">Sortie : .xlsx</p>
            </div>

            <div onclick="openModal('Word to PDF')" class="group glass-card p-12 rounded-[3rem] cursor-pointer border-t-4 border-red-500/50">
                <div class="w-20 h-20 bg-red-500/10 rounded-3xl flex items-center justify-center mx-auto mb-8 group-hover:bg-red-500/20 transition-colors">
                    <i class="fas fa-file-pdf text-4xl text-red-500"></i>
                </div>
                <h3 class="text-xl font-black text-white italic uppercase mb-3">Word en PDF</h3>
                <p class="text-slate-500 text-[10px] font-bold uppercase tracking-widest">Sortie : .pdf</p>
            </div>
        </div>

        <div class="glass-card rounded-[3rem] overflow-hidden text-left shadow-2xl border border-slate-800">
            <div class="p-8 border-b border-slate-800 flex justify-between items-center bg-slate-900/50">
                <h2 class="text-xs font-black uppercase tracking-[0.3em] text-white">
                    <i class="fas fa-history mr-3 text-red-500"></i> Historique local
                </h2>
                <div class="flex items-center gap-2">
                    <span class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></span>
                    <span class="text-[9px] font-black text-slate-500 uppercase">Système Prêt</span>
                </div>
            </div>
            
            <div class="overflow-x-auto">
                <table class="w-full text-left text-sm">
                    <thead class="text-[9px] font-black text-slate-500 uppercase tracking-widest border-b border-slate-800">
                        <tr>
                            <th class="p-8">Document</th>
                            <th class="p-8">Format Cible</th>
                            <th class="p-8">État</th>
                            <th class="p-8">Action</th>
                        </tr>
                    </thead>
                    <tbody class="font-bold">
                        <tr class="border-b border-slate-800/30 row-hover transition-all">
                            <td class="p-8 text-white italic">Rapport_JK_2026.pdf</td>
                            <td class="p-8 text-blue-400 uppercase">DOCX</td>
                            <td class="p-8"><span class="bg-green-500/10 text-green-500 py-1 px-3 rounded-full text-[9px] border border-green-500/20">Terminé</span></td>
                            <td class="p-8"><a href="#" class="text-slate-500 hover:text-red-500 transition"><i class="fas fa-download"></i></a></td>
                        </tr>
                        <tr class="row-hover transition-all">
                            <td class="p-8 text-white italic">Donnees_Cloud.xlsx</td>
                            <td class="p-8 text-green-400 uppercase">PDF</td>
                            <td class="p-8"><span class="bg-green-500/10 text-green-500 py-1 px-3 rounded-full text-[9px] border border-green-500/20">Terminé</span></td>
                            <td class="p-8"><a href="#" class="text-slate-500 hover:text-red-500 transition"><i class="fas fa-download"></i></a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <div id="convertModal" class="hidden fixed inset-0 bg-[#0f172a]/95 backdrop-blur-2xl flex items-center justify-center z-[100] p-4">
        <div class="glass-card w-full max-w-lg rounded-[3.5rem] p-12 relative border border-white/10 shadow-2xl">
            <button onclick="closeModal()" class="absolute top-10 right-10 text-slate-500 hover:text-white transition-all">
                <i class="fas fa-times text-2xl"></i>
            </button>
            
            <div class="text-center mb-10">
                <div id="modalIcon" class="w-20 h-20 bg-red-500/10 rounded-3xl flex items-center justify-center mx-auto mb-6">
                    <i class="fas fa-upload text-3xl text-red-500"></i>
                </div>
                <h2 id="modalTitle" class="text-3xl font-black text-white italic uppercase tracking-tighter">Outil</h2>
            </div>

            <form action="${pageContext.request.contextPath}/convert" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="toolType" id="conversionTypeInput">
                <input type="file" name="file" id="fileInput" class="hidden" required onchange="updateFileName(this)">
                
                <label for="fileInput" class="flex flex-col items-center justify-center w-full h-56 border-2 border-dashed border-slate-700 rounded-[2.5rem] cursor-pointer hover:border-red-500/50 hover:bg-slate-800 transition-all mb-8">
                    <div id="uploadContent">
                        <i class="fas fa-cloud-upload-alt text-4xl text-slate-600 mb-4"></i>
                        <p class="text-slate-500 font-black text-[10px] uppercase tracking-widest">Cliquez pour importer</p>
                    </div>
                    <div id="fileSelected" class="hidden text-center px-6">
                        <i class="fas fa-file-circle-check text-4xl text-green-500 mb-4"></i>
                        <p id="fileNameDisplay" class="text-white font-bold text-sm truncate w-64"></p>
                    </div>
                </label>

                <button type="submit" id="submitBtn" class="w-full bg-red-600 py-6 rounded-2xl font-black uppercase text-xs tracking-[0.3em] hover:bg-red-700 shadow-2xl shadow-red-600/20 transition-all">
                    Démarrer la conversion
                </button>
            </form>
        </div>
    </div>

    <footer class="py-12 text-center text-[9px] font-black text-slate-700 uppercase tracking-[0.6em] mt-auto">
        JKCONVERTER CLOUD CLUSTER v2.0 © 2026
    </footer>

    <script>
        function openModal(type) {
            document.getElementById('convertModal').classList.remove('hidden');
            document.getElementById('conversionTypeInput').value = type;
            document.getElementById('modalTitle').innerText = type;
            
            // Reset
            document.getElementById('uploadContent').classList.remove('hidden');
            document.getElementById('fileSelected').classList.add('hidden');
            document.getElementById('submitBtn').innerText = "Démarrer la conversion";
            document.getElementById('fileInput').value = "";
        }

        function closeModal() { 
            document.getElementById('convertModal').classList.add('hidden'); 
        }

        function updateFileName(input) {
            if (input.files && input.files[0]) {
                document.getElementById('uploadContent').classList.add('hidden');
                document.getElementById('fileSelected').classList.remove('hidden');
                document.getElementById('fileNameDisplay').innerText = input.files[0].name;
                
                // On met à jour le texte du bouton avec le format de destination
                const tool = document.getElementById('conversionTypeInput').value;
                const destination = tool.split(' to ')[1];
                document.getElementById('submitBtn').innerText = "Convertir en " + destination;
            }
        }
    </script>
</body>
</html>