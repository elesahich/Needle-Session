

import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class BookDetailProtocol7314e15872c23b34bbcfProvider: BookDetailProtocol {


    init() {

    }
}
/// ^->RootComponent->TabbarComponent->NewComponent->BookDetailComponent
private func factory490d733513a42adcb219e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return BookDetailProtocol7314e15872c23b34bbcfProvider()
}
private class NewDependency2688ffcaacdab8cb2233Provider: NewDependency {
    var network: Networking {
        return rootComponent.network
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->TabbarComponent->NewComponent
private func factorydf4669e99932e9220f94a9403e3301bb54f80df0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NewDependency2688ffcaacdab8cb2233Provider(rootComponent: parent2(component) as! RootComponent)
}

#else
extension RootComponent: Registration {
    public func registerItems() {


    }
}
extension BookDetailComponent: Registration {
    public func registerItems() {

    }
}
extension TabbarComponent: Registration {
    public func registerItems() {


    }
}
extension NewComponent: Registration {
    public func registerItems() {
        keyPathToName[\NewDependency.network] = "network-Networking"

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

private func register1() {
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->TabbarComponent->NewComponent->BookDetailComponent", factory490d733513a42adcb219e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->TabbarComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->TabbarComponent->NewComponent", factorydf4669e99932e9220f94a9403e3301bb54f80df0)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
