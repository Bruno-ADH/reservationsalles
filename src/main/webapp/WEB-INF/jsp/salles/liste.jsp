<%@ include file="../header.jsp" %>

<div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-white neon-text-cyan">Liste des Salles</h1>
    <a href="/salles/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium">
        + Ajouter une salle
    </a>
</div>

<div class="glass rounded-2xl neon-cyan overflow-hidden">
    <table class="min-w-full">
        <thead>
            <tr class="border-b border-white/10">
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">ID</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Nom</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Capacite</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Localisation</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Disponible</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-cyan-300 uppercase tracking-wider">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${salles}">
                <tr class="border-b border-white/5 table-row transition duration-200">
                    <td class="px-6 py-4 text-sm text-gray-300">${s.id}</td>
                    <td class="px-6 py-4 text-sm text-gray-200 font-medium">${s.nom}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${s.capacite}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${s.localisation}</td>
                    <td class="px-6 py-4 text-sm">
                        <c:choose>
                            <c:when test="${s.disponible}">
                                <span class="text-green-400 font-medium" style="text-shadow: 0 0 8px rgba(74, 222, 128, 0.6);">Oui</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-red-400 font-medium" style="text-shadow: 0 0 8px rgba(248, 113, 113, 0.6);">Non</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="px-6 py-4 text-sm space-x-3">
                        <a href="/salles/modifier/${s.id}" class="text-cyan-400 hover:text-cyan-300 transition">Modifier</a>
                        <a href="/salles/supprimer/${s.id}" class="text-red-400 hover:text-red-300 transition"
                           onclick="return confirm('Supprimer cette salle ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
