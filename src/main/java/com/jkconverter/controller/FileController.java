package com.jkconverter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FileController {

    // Chemin dynamique pour NetBeans
    private final String UPLOAD_DIR = System.getProperty("user.dir") + "/src/main/webapp/uploads/";

    // Affiche la page index.jsp quand on arrive sur http://localhost:8080/
    @GetMapping("/")
    public String showIndex() {
        return "index";
    }

    @PostMapping("/convert")
    public String handleConversion(@RequestParam("file") MultipartFile file, 
                                   @RequestParam("toolType") String toolType, 
                                   Model model, 
                                   HttpSession session) {
        
        if (file.isEmpty()) return "redirect:/?error=empty";

        try {
            // Créer le dossier s'il n'existe pas
            File directory = new File(UPLOAD_DIR);
            if (!directory.exists()) directory.mkdirs();

            // 1. Nettoyage du nom original
            String originalFullFileName = file.getOriginalFilename();
            String nameWithoutExtension = "document";
            if (originalFullFileName != null && originalFullFileName.contains(".")) {
                nameWithoutExtension = originalFullFileName.substring(0, originalFullFileName.lastIndexOf("."));
            }

            // 2. Logique d'extension selon le toolType reçu du JavaScript
            String finalExtension = ".pdf"; 
            String tool = toolType.toLowerCase();

            if (tool.endsWith("word")) {
                finalExtension = ".docx";
            } else if (tool.endsWith("excel")) {
                finalExtension = ".xlsx";
            } else if (tool.endsWith("pdf")) {
                finalExtension = ".pdf";
            }

            // 3. Construction du nom final
            String outputFileName = nameWithoutExtension + finalExtension;

            // 4. Sauvegarde physique
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOAD_DIR + outputFileName);
            Files.write(path, bytes);

            // 5. Envoi des données vers result.jsp
            model.addAttribute("fileName", outputFileName);
            session.setAttribute("fileName", outputFileName);

            return "result"; 

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/?error=server";
        }
    }
}