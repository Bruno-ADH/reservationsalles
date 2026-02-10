<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
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
        .btn-icon-edit {
            background: rgba(6, 182, 212, 0.15);
            border: 1px solid rgba(6, 182, 212, 0.4);
            transition: all 0.3s ease;
        }
        .btn-icon-edit:hover {
            background: rgba(6, 182, 212, 0.35);
            box-shadow: 0 0 15px rgba(6, 182, 212, 0.5);
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
        input[type="checkbox"] { accent-color: #8b5cf6; }
        option { background: #1e1b4b; color: #e2e8f0; }
        [data-tooltip] { position: relative; }
        [data-tooltip]:hover::after {
            content: attr(data-tooltip);
            position: absolute;
            bottom: 120%;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(15, 12, 41, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: #e2e8f0;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            white-space: nowrap;
            z-index: 50;
        }
        #mobile-menu { max-height: 0; overflow: hidden; transition: max-height 0.3s ease; }
        #mobile-menu.open { max-height: 300px; }
    </style>
</head>
<body>
    <nav class="glass border-b border-white/10">
        <div class="max-w-7xl mx-auto px-4 sm:px-6">
            <div class="flex justify-between h-16 items-center">
                <a href="/" class="text-xl sm:text-2xl font-bold text-violet-400 neon-text-purple tracking-wide">
                    <i class="fa-solid fa-champagne-glasses mr-2"></i>ReservaSalles
                </a>
                <!-- Desktop menu -->
                <div class="hidden md:flex items-center space-x-8">
                    <a href="/salles/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
                        <i class="fa-solid fa-door-open mr-1.5"></i>Salles
                    </a>
                    <a href="/utilisateurs/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
                        <i class="fa-solid fa-users mr-1.5"></i>Utilisateurs
                    </a>
                    <a href="/reservations/liste" class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
                        <i class="fa-solid fa-calendar-check mr-1.5"></i>Reservations
                    </a>
                </div>
                <!-- Burger button -->
                <button onclick="document.getElementById('mobile-menu').classList.toggle('open')"
                        class="md:hidden text-gray-400 hover:text-cyan-400 transition text-xl p-2">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
        </div>
        <!-- Mobile menu -->
        <div id="mobile-menu" class="md:hidden border-t border-white/5">
            <div class="px-4 py-3 space-y-3">
                <a href="/salles/liste" class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                    <i class="fa-solid fa-door-open mr-2"></i>Salles
                </a>
                <a href="/utilisateurs/liste" class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                    <i class="fa-solid fa-users mr-2"></i>Utilisateurs
                </a>
                <a href="/reservations/liste" class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                    <i class="fa-solid fa-calendar-check mr-2"></i>Reservations
                </a>
            </div>
        </div>
    </nav>
    <main class="max-w-7xl mx-auto px-4 sm:px-6 py-6 sm:py-10">
