package org.konan.multiplatform

import com.makegoodstuff.StoryShared.Platform
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class PlatformTest {
    @Test
    fun `should print Android`() {
        assertEquals(Platform().platform, "Android")
    }
}

// Note that common tests for calculator (i.e. `CalculatorTest`) can be run from `StoryShared`
// with `test` Gradle task.
