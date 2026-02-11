<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!doctype html>
    <html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.3/dist/confetti.browser.min.js"></script>
        <link id="favicon" rel="icon" type="image/png" href="/favicon/001.png" />

        <title>FestiPlace</title>
        <style>
            body {
                /* background: linear-gradient(135deg, #0f0c29, #302b63, #24243e); */
                background-image: url("/bgimage.webp");
                min-height: 100vh;
            }

            body::after {
                content: "";
                position: fixed;
                inset: 0;
                background: linear-gradient(135deg, #0f0c29ed, #302b63ed, #24243eed);
                pointer-events: none;
                z-index: -1;
            }

            .glass {
                background-color: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .neon-purple {
                box-shadow: 0 0 15px rgba(139, 92, 246, 0.5), 0 0 30px rgba(139, 92, 246, 0.2);
                --spotlight-color: rgba(139, 92, 246, 0.35);
            }

            .neon-cyan {
                box-shadow: 0 0 15px rgba(6, 182, 212, 0.5), 0 0 30px rgba(6, 182, 212, 0.2);
                --spotlight-color: rgba(6, 182, 212, 0.35);
            }

            .neon-pink {
                box-shadow: 0 0 15px rgba(236, 72, 153, 0.5), 0 0 30px rgba(236, 72, 153, 0.2);
                --spotlight-color: rgba(236, 72, 153, 0.35);
            }

            .neon-text-purple {
                text-shadow: 0 0 10px rgba(139, 92, 246, 0.8), 0 0 20px rgba(139, 92, 246, 0.4);
            }

            .neon-text-cyan {
                text-shadow: 0 0 10px rgba(6, 182, 212, 0.8), 0 0 20px rgba(6, 182, 212, 0.4);
            }

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

            .table-row:hover {
                background: rgba(139, 92, 246, 0.08);
            }

            input,
            select {
                background: rgba(255, 255, 255, 0.05) !important;
                color: #e2e8f0 !important;
                border-color: rgba(255, 255, 255, 0.15) !important;
            }

            input:focus,
            select:focus {
                box-shadow: 0 0 12px rgba(139, 92, 246, 0.5) !important;
                border-color: rgba(139, 92, 246, 0.5) !important;
                outline: none !important;
            }

            input[type="checkbox"] {
                accent-color: #8b5cf6;
            }

            option {
                background: #1e1b4b;
                color: #e2e8f0;
            }

            [data-tooltip] {
                position: relative;
            }

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

            #mobile-menu {
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.3s ease;
            }

            #mobile-menu.open {
                max-height: 300px;
            }

            .desk a {
                position: relative;
                /* nécessaire pour que les ::before/::after soient bien placés */
            }

            .desk a::before,
            .desk a::after {
                content: "";
                position: absolute;
                bottom: -.8rem;
                height: .8rem;
                width: .15rem;
                border-radius: .5rem;
                background-color: rgba(6, 182, 212, .9);
                opacity: 0;
                transform: rotateZ(0) translate(0, 0);
                transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
            }

            .desk a::before {
                left: 40%;
            }

            .desk a::after {
                left: 60%;
            }

            .desk a:hover::before {
                transform: translate(-40%, 0) rotateZ(50deg);
                opacity: 1;
            }

            .desk a:hover::after {
                transform: translate(-60%, 0) rotateZ(-50deg);
                opacity: 1;
            }


            .card {
                position: relative;
                overflow: hidden;
            }

            .card::before {
                content: "";
                position: absolute;
                inset: 0;
                pointer-events: none;
                background: radial-gradient(180px circle at var(--x, 50%) var(--y, 50%),
                        var(--spotlight-color),
                        transparent 60%);
                opacity: 0;
                transition: opacity 0.25s ease;
                z-index: 0;
            }

            .card:hover::before {
                opacity: 1;
            }

            .card>* {
                position: relative;
                z-index: 1;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const FRAME_COUNT = 34;
                const FRAME_DELAY = 100;
                const FRAMES = [];
                for (let i = 1; i <= FRAME_COUNT; i++) {
                    FRAMES.push("/favicon/" + String(i).padStart(3, "0") + ".png");
                }

                let index = 0;
                let intervalId = null;
                const favicon = document.getElementById("favicon");

                FRAMES.forEach(function (src) {
                    const img = new Image();
                    img.src = src;
                });

                function startAnimation() {
                    if (intervalId) return;
                    intervalId = setInterval(function () {
                        favicon.href = FRAMES[index];
                        index = (index + 1) % FRAMES.length;
                    }, FRAME_DELAY);
                }

                function stopAnimation() {
                    clearInterval(intervalId);
                    intervalId = null;
                }

                document.addEventListener("visibilitychange", function () {
                    if (document.hidden) {
                        stopAnimation();
                    } else {
                        startAnimation();
                    }
                });

                startAnimation();
            });
        </script>

    </head>

    <body>
        <nav class="sticky top-0 glass border-b border-white/10">
            <div class="max-w-7xl mx-auto px-4 sm:px-6">
                <div class="flex justify-between h-16 items-center">
                    <a href="/" class="flex items-center">
                        <img src="/logo.svg" alt="FestiPlace" class="h-8 sm:h-10" />
                    </a>
                    <!-- Desktop menu -->
                    <div class="hidden desk md:flex items-center space-x-8">
                        <a href="/salles/liste"
                            class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
                            <i class="fa-solid fa-door-open mr-1.5"></i>Salles
                        </a>
                        <a href="/utilisateurs/liste"
                            class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
                            <i class="fa-solid fa-users mr-1.5"></i>Utilisateurs
                        </a>
                        <a href="/reservations/liste"
                            class="text-gray-400 hover:text-cyan-400 transition duration-300 font-medium">
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
                    <a href="/salles/liste"
                        class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                        <i class="fa-solid fa-door-open mr-2"></i>Salles
                    </a>
                    <a href="/utilisateurs/liste"
                        class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                        <i class="fa-solid fa-users mr-2"></i>Utilisateurs
                    </a>
                    <a href="/reservations/liste"
                        class="block text-gray-400 hover:text-cyan-400 transition duration-300 font-medium py-2">
                        <i class="fa-solid fa-calendar-check mr-2"></i>Reservations
                    </a>
                </div>
            </div>
        </nav>
        <main class="max-w-7xl mx-auto px-4 sm:px-6 py-6 sm:py-10">