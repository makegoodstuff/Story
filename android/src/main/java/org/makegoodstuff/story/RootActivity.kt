package org.makegoodstuff.story


import android.view.ViewGroup
import com.uber.rib.core.RibActivity
import com.uber.rib.core.ViewRouter
import org.makegoodstuff.story.root.RootBuilder

/**
 * The sample app's single activity.
 */
class RootActivity() : RibActivity() {

    protected override fun createRouter(parentViewGroup: ViewGroup): ViewRouter<*, *, *> {
        val rootBuilder = RootBuilder(object : RootBuilder.ParentComponent {

        })
        return rootBuilder.build(parentViewGroup)
    }
}
