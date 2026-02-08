<%@ include file="header.jsp" %>

<div class="text-center py-20">
    <h1 class="text-5xl font-bold text-white mb-3 neon-text-purple">ReservaSalles</h1>
    <p class="text-lg text-gray-400 mb-14">Plateforme de reservation en ligne de salles de fete</p>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto">
        <a href="/salles/liste" class="glass rounded-2xl p-10 neon-purple hover:scale-105 transition-transform duration-300">
            <h2 class="text-2xl font-semibold text-violet-400 mb-3">Salles</h2>
            <p class="text-gray-400">Gerer les salles de fete</p>
        </a>
        <a href="/utilisateurs/liste" class="glass rounded-2xl p-10 neon-cyan hover:scale-105 transition-transform duration-300">
            <h2 class="text-2xl font-semibold text-cyan-400 mb-3">Utilisateurs</h2>
            <p class="text-gray-400">Gerer les utilisateurs</p>
        </a>
        <a href="/reservations/liste" class="glass rounded-2xl p-10 neon-pink hover:scale-105 transition-transform duration-300">
            <h2 class="text-2xl font-semibold text-pink-400 mb-3">Reservations</h2>
            <p class="text-gray-400">Gerer les reservations</p>
        </a>
    </div>
</div>

<%@ include file="footer.jsp" %>
