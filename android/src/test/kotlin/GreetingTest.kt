package org.konan.multiplatform

import com.makegoodstuff.StoryShared.Greeting
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class GreetingTest {

    @Test
    fun `should print hello android from android mpp`() {
        assertEquals(Greeting().StoryShared(), "Hello, Android")
    }
}

// Note that common tests for calculator (i.e. `CalculatorTest`) can be run from `StoryShared`
// with `test` Gradle task.
