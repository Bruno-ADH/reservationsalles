<%@ include file="../header.jsp" %>

<div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-white neon-text-cyan">Liste des Reservations</h1>
    <a href="/reservations/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium">
        + Nouvelle reservation
    </a>
</div>

<div class="glass rounded-2xl neon-pink overflow-hidden">
    <table class="min-w-full">
        <thead>
            <tr class="border-b border-white/10">
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">ID</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Date</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Heure Debut</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Heure Fin</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Utilisateur</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Salle</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-pink-300 uppercase tracking-wider">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${reservations}">
                <tr class="border-b border-white/5 table-row transition duration-200">
                    <td class="px-6 py-4 text-sm text-gray-300">${r.id}</td>
                    <td class="px-6 py-4 text-sm text-gray-200 font-medium">${r.dateReservation}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${r.heureDebut}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${r.heureFin}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${r.utilisateur.nom}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${r.salle.nom}</td>
                    <td class="px-6 py-4 text-sm space-x-3">
                        <a href="/reservations/modifier/${r.id}" class="text-cyan-400 hover:text-cyan-300 transition">Modifier</a>
                        <a href="/reservations/supprimer/${r.id}" class="text-red-400 hover:text-red-300 transition"
                           onclick="return confirm('Supprimer cette reservation ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
