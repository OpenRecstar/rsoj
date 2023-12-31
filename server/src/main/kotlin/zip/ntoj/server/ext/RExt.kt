package zip.ntoj.server.ext

import org.springframework.http.ResponseEntity
import zip.ntoj.shared.model.R

fun <T> R.Companion.success(code: Int, message: String, data: T? = null): ResponseEntity<R<T>> {
    return ResponseEntity.status(code).body(R(code, message, data))
}

fun R.Companion.fail(
    code: Int,
    message: String,
    requestId: String? = null,
): ResponseEntity<R<Void>> {
    return ResponseEntity.status(code).body(R(code, message, null, requestId))
}
