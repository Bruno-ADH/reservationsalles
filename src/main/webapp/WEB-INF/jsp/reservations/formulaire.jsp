<%@ include file="../header.jsp" %>

<div class="max-w-lg mx-auto">
    <h1 class="text-3xl font-bold text-white neon-text-cyan mb-8">
        ${reservation.id != null ? 'Modifier' : 'Nouvelle'} Reservation
    </h1>

    <form action="/reservations/save" method="post" class="glass rounded-2xl neon-pink p-8 space-y-5">
        <c:if test="${reservation.id != null}">
            <input type="hidden" name="id" value="${reservation.id}" />
        </c:if>

        <div>
            <label class="block text-sm font-medium text-pink-300 mb-2">Date de reservation</label>
            <input type="date" name="dateReservation" value="${reservation.dateReservation}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-pink-300 mb-2">Heure de debut</label>
            <input type="time" name="heureDebut" value="${reservation.heureDebut}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-pink-300 mb-2">Heure de fin</label>
            <input type="time" name="heureFin" value="${reservation.heureFin}" required
                   class="w-full rounded-xl px-4 py-3" />
        </div>

        <div>
            <label class="block text-sm font-medium text-pink-300 mb-2">Utilisateur</label>
            <select name="utilisateurId" required class="w-full rounded-xl px-4 py-3">
                <option value="">-- Choisir un utilisateur --</option>
                <c:forEach var="u" items="${utilisateurs}">
                    <option value="${u.id}" ${reservation.utilisateur != null && reservation.utilisateur.id == u.id ? 'selected' : ''}>
                        ${u.nom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label class="block text-sm font-medium text-pink-300 mb-2">Salle</label>
            <select name="salleId" required class="w-full rounded-xl px-4 py-3">
                <option value="">-- Choisir une salle --</option>
                <c:forEach var="s" items="${salles}">
                    <option value="${s.id}" ${reservation.salle != null && reservation.salle.id == s.id ? 'selected' : ''}>
                        ${s.nom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="flex space-x-4 pt-4">
            <button type="submit" class="btn-neon text-violet-300 px-8 py-3 rounded-xl font-medium">
                Enregistrer
            </button>
            <a href="/reservations/liste" class="btn-neon-gray text-gray-300 px-8 py-3 rounded-xl font-medium">
                Annuler
            </a>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
