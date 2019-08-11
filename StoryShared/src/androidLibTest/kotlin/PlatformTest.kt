package com.makegoodstuff.StoryShared

import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.junit.Assert.assertEquals
import org.junit.Test
import kotlin.test.Ignore

// special class for running test within IDE
@Ignore
@RunWith(JUnit4::class)
class PlatformTest {
    @Test
    fun `should print Android`() {
        assertEquals(Platform().platform, "Android")
    }
}
