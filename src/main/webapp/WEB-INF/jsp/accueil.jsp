<%@ include file="header.jsp" %>

    <div class="text-center py-10 sm:py-20">
        <div class="flex justify-center mb-4">
            <img src="/logo.svg" alt="FestiPlace" class="h-14 sm:h-20" />
        </div>
        <p class="text-base sm:text-lg text-gray-400 mb-10 sm:mb-14 px-4">Plateforme de reservation en ligne de salles
            de fete</p>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-5 sm:gap-8 max-w-4xl mx-auto px-2">
            <a href="/salles/liste"
                class="glass card rounded-2xl p-8 sm:p-10 neon-purple hover:scale-105 transition-transform duration-300">
                <i class="fa-solid fa-door-open text-3xl sm:text-4xl text-violet-400 mb-4"></i>
                <h2 class="text-xl sm:text-2xl font-semibold text-violet-400 mb-3">Salles</h2>
                <p class="text-gray-400 text-sm sm:text-base">Gerer les salles de fete</p>
            </a>
            <a href="/utilisateurs/liste"
                class="glass card rounded-2xl p-8 sm:p-10 neon-cyan hover:scale-105 transition-transform duration-300">
                <i class="fa-solid fa-users text-3xl sm:text-4xl text-cyan-400 mb-4"></i>
                <h2 class="text-xl sm:text-2xl font-semibold text-cyan-400 mb-3">Utilisateurs</h2>
                <p class="text-gray-400 text-sm sm:text-base">Gerer les utilisateurs</p>
            </a>
            <a href="/reservations/liste"
                class="glass card rounded-2xl p-8 sm:p-10 neon-pink hover:scale-105 transition-transform duration-300">
                <i class="fa-solid fa-calendar-check text-3xl sm:text-4xl text-pink-400 mb-4"></i>
                <h2 class="text-xl sm:text-2xl font-semibold text-pink-400 mb-3">Reservations</h2>
                <p class="text-gray-400 text-sm sm:text-base">Gerer les reservations</p>
            </a>
        </div>
    </div>

    <script>
        document.querySelectorAll(".card").forEach(function (card) {
            card.addEventListener("mousemove", function (e) {
                var rect = card.getBoundingClientRect();
                card.style.setProperty("--x", (e.clientX - rect.left) + "px");
                card.style.setProperty("--y", (e.clientY - rect.top) + "px");
            });

            // card.addEventListener("mouseleave", function () {
            //     card.style.setProperty("--x", "50%");
            //     card.style.setProperty("--y", "50%");
            // });
        });
    </script>


<%@ include file="footer.jsp" %>