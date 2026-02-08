<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>ReservaSalles</title>
    <style>
        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
        }
        .glass {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .neon-purple { box-shadow: 0 0 15px rgba(139, 92, 246, 0.5), 0 0 30px rgba(139, 92, 246, 0.2); }
        .neon-cyan { box-shadow: 0 0 15px rgba(6, 182, 212, 0.5), 0 0 30px rgba(6, 182, 212, 0.2); }
        .neon-pink { box-shadow: 0 0 15px rgba(236, 72, 153, 0.5), 0 0 30px rgba(236, 72, 153, 0.2); }
        .neon-text-purple { text-shadow: 0 0 10px rgba(139, 92, 246, 0.8), 0 0 20px rgba(139, 92, 246, 0.4); }
        .neon-text-cyan { text-shadow: 0 0 10px rgba(6, 182, 212, 0.8), 0 0 20px rgba(6, 182, 212, 0.4); }
        .btn-neon {
            background: rgba(139, 92, 246, 0.2);
            border: 1px solid rgba(139, 92, 246, 0.5);
            transition: all 0.3s ease;
        }
        .btn-neon:hover {
            background: rgba(139, 92, 246, 0.4);
            box-shadow: 0 0 20px rgba(139, 92, 246, 0.6);
        }
        .btn-neon-red {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.4);
            transition: all 0.3s ease;
        }
        .btn-neon-red:hover {
            background: rgba(239, 68, 68, 0.3);
            box-shadow: 0 0 20px rgba(239, 68, 68, 0.5);
        }
        .btn-neon-gray {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        .btn-neon-gray:hover {
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
        }
        .table-row:hover { background: rgba(139, 92, 246, 0.08); }
        input, select {
            background: rgba(255, 255, 255, 0.05) !important;
            color: #e2e8f0 !important;
            border-color: rgba(255, 255, 255, 0.15) !important;
        }
        input:focus, select:focus {
            box-shadow: 0 0 12px rgba(139, 92, 246, 0.5) !important;
            border-color: rgba(139, 92, 246, 0.5) !important;
            outline: none !important;
        }
        option { background: #1e1b4b; color: #e2e8f0; }
    </style>
</head>
<body>
    <nav class="glass border-b border-white/10">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex justify-between h-16">
                <div class="flex items-center space-x-8">
                    <a href="/" class="text-2xl font-bold text-violet-400 neon-text-purple tracking-wide">ReservaSalles</a>
                    <a href="/salles/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">Salles</a>
                    <a href="/utilisateurs/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">Utilisateurs</a>
                    <a href="/reservations/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">Reservations</a>
                </div>
            </div>
        </div>
    </nav>
    <main class="max-w-7xl mx-auto px-6 py-10">
