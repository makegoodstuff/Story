package org.makegoodstuff.story.root.root

import com.badoo.common.ribs.RibsRule
import com.badoo.ribs.RibTestActivity
import com.badoo.ribs.core.directory.Directory
import org.makegoodstuff.story.root.root.builder.RootBuilder
import io.reactivex.Observable.empty
import io.reactivex.ObservableSource
import io.reactivex.functions.Consumer
import org.junit.Rule
import org.junit.Test

class RootTest {

    @get:Rule
    val ribsRule = RibsRule { buildRib(it) }

    private fun buildRib(ribTestActivity: RibTestActivity) =
        RootBuilder(object : Root.Dependency {
            override fun rootInput(): ObservableSource<Root.Input> = empty()
            override fun rootOutput(): Consumer<Root.Output> = Consumer {}
            override fun ribCustomisation(): Directory = TODO()
        }).build()

    @Test
    fun testTextDisplayed() {
        TODO("Write UI tests")
    }
}
