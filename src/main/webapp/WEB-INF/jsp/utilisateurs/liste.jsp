<%@ include file="../header.jsp" %>

<div class="flex justify-between items-center mb-8">
    <h1 class="text-3xl font-bold text-white neon-text-cyan">Liste des Utilisateurs</h1>
    <a href="/utilisateurs/nouveau" class="btn-neon text-violet-300 px-5 py-2.5 rounded-xl font-medium">
        + Ajouter un utilisateur
    </a>
</div>

<div class="glass rounded-2xl neon-purple overflow-hidden">
    <table class="min-w-full">
        <thead>
            <tr class="border-b border-white/10">
                <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">ID</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Nom</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Email</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Role</th>
                <th class="px-6 py-4 text-left text-xs font-semibold text-violet-300 uppercase tracking-wider">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${utilisateurs}">
                <tr class="border-b border-white/5 table-row transition duration-200">
                    <td class="px-6 py-4 text-sm text-gray-300">${u.id}</td>
                    <td class="px-6 py-4 text-sm text-gray-200 font-medium">${u.nom}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${u.email}</td>
                    <td class="px-6 py-4 text-sm text-gray-300">${u.role}</td>
                    <td class="px-6 py-4 text-sm space-x-3">
                        <a href="/utilisateurs/modifier/${u.id}" class="text-cyan-400 hover:text-cyan-300 transition">Modifier</a>
                        <a href="/utilisateurs/supprimer/${u.id}" class="text-red-400 hover:text-red-300 transition"
                           onclick="return confirm('Supprimer cet utilisateur ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
