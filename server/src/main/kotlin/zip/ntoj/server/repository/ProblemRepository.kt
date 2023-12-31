package zip.ntoj.server.repository

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.JpaSpecificationExecutor
import zip.ntoj.server.model.Problem
import java.util.Optional

interface ProblemRepository : JpaRepository<Problem, Long>, JpaSpecificationExecutor<Problem> {
    fun findByAlias(alias: String): Optional<Problem>
}
