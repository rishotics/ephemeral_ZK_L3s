; ModuleID = 'probe1.e6e83e6f2a13c884-cgu.0'
source_filename = "probe1.e6e83e6f2a13c884-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

%"core::fmt::Arguments<'_>" = type { { ptr, i64 }, { ptr, i64 }, { ptr, i64 } }
%"alloc::string::String" = type { %"alloc::vec::Vec<u8>" }
%"alloc::vec::Vec<u8>" = type { { ptr, i64 }, i64 }
%"core::ptr::metadata::PtrRepr<[u8]>" = type { [2 x i64] }
%"alloc::alloc::Global" = type {}
%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>" = type { [1 x i64], i64, [1 x i64] }

@alloc_2a62ba4d4fa46537b277796d74f8c568 = private unnamed_addr constant <{}> zeroinitializer, align 8
@alloc_91c7fa63c3cfeaa3c795652d5cf060e4 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc_560206a49c61adca6f3f0639a12632eb = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_91c7fa63c3cfeaa3c795652d5cf060e4, [8 x i8] c"\0C\00\00\00\00\00\00\00" }>, align 8
@alloc_0bc42bba2f94396c4f33d7743bb6e9ae = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/4c8bb79d9f565115637cc6da739f8389e79f3a29/library/core/src/fmt/mod.rs" }>, align 1
@alloc_b3ea6872b8fe52b6826da5061f4dafb2 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_0bc42bba2f94396c4f33d7743bb6e9ae, [16 x i8] c"K\00\00\00\00\00\00\005\01\00\00\0D\00\00\00" }>, align 8
@alloc_6ed044d52462a4f1ff23588a8337e699 = private unnamed_addr constant <{ [80 x i8] }> <{ [80 x i8] c"/rustc/4c8bb79d9f565115637cc6da739f8389e79f3a29/library/core/src/alloc/layout.rs" }>, align 1
@alloc_da2be1d7c9b8e626f47bd194c1756aaa = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_6ed044d52462a4f1ff23588a8337e699, [16 x i8] c"P\00\00\00\00\00\00\00\BF\01\00\00)\00\00\00" }>, align 8
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"
@__rust_no_alloc_shim_is_unstable = external global i8
@alloc_ffa3cdb3ae88e54a1cc225f31dd07672 = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_2a62ba4d4fa46537b277796d74f8c568, [8 x i8] zeroinitializer }>, align 8
@alloc_53973d2fe29b4adba8bb7390b5678745 = private unnamed_addr constant <{ [8 x i8] }> zeroinitializer, align 8

; core::fmt::Arguments::as_str
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @_ZN4core3fmt9Arguments6as_str17h8c83f2b61acff4bdE(ptr align 8 %self) unnamed_addr #0 {
start:
  %_0 = alloca { ptr, i64 }, align 8
  %0 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 0
  %_2.0 = load ptr, ptr %0, align 8, !nonnull !1, !align !2, !noundef !1
  %1 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  %_2.1 = load i64, ptr %1, align 8, !noundef !1
  %2 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %self, i32 0, i32 1
  %3 = getelementptr inbounds { ptr, i64 }, ptr %2, i32 0, i32 0
  %_3.0 = load ptr, ptr %3, align 8, !nonnull !1, !align !2, !noundef !1
  %4 = getelementptr inbounds { ptr, i64 }, ptr %2, i32 0, i32 1
  %_3.1 = load i64, ptr %4, align 8, !noundef !1
  %_15 = icmp eq i64 %_2.1, 0
  br i1 %_15, label %bb1, label %bb3

bb3:                                              ; preds = %start
  %_12 = icmp eq i64 %_2.1, 1
  br i1 %_12, label %bb4, label %bb2

bb1:                                              ; preds = %start
  %_6 = icmp eq i64 %_3.1, 0
  br i1 %_6, label %bb5, label %bb2

bb2:                                              ; preds = %bb1, %bb4, %bb3
  store ptr null, ptr %_0, align 8
  br label %bb7

bb4:                                              ; preds = %bb3
  %_9 = icmp eq i64 %_3.1, 0
  br i1 %_9, label %bb6, label %bb2

bb6:                                              ; preds = %bb4
  %5 = getelementptr inbounds [0 x { ptr, i64 }], ptr %_2.0, i64 0, i64 0
  %6 = getelementptr inbounds { ptr, i64 }, ptr %5, i32 0, i32 0
  %_17.0 = load ptr, ptr %6, align 8, !nonnull !1, !align !3, !noundef !1
  %7 = getelementptr inbounds { ptr, i64 }, ptr %5, i32 0, i32 1
  %_17.1 = load i64, ptr %7, align 8, !noundef !1
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %_17.0, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %_17.1, ptr %9, align 8
  br label %bb7

bb7:                                              ; preds = %bb5, %bb2, %bb6
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8, !align !3, !noundef !1
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = insertvalue { ptr, i64 } poison, ptr %11, 0
  %15 = insertvalue { ptr, i64 } %14, i64 %13, 1
  ret { ptr, i64 } %15

bb5:                                              ; preds = %bb1
  %16 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr @alloc_2a62ba4d4fa46537b277796d74f8c568, ptr %16, align 8
  %17 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 0, ptr %17, align 8
  br label %bb7
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117hadee2cabe50b2b86E(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_0, ptr align 8 %pieces.0, i64 %pieces.1, ptr align 8 %args.0, i64 %args.1) unnamed_addr #0 {
start:
  %_16 = alloca { ptr, i64 }, align 8
  %_14 = alloca { ptr, i64 }, align 8
  %_12 = alloca %"core::fmt::Arguments<'_>", align 8
  %_3 = alloca i8, align 1
  %_4 = icmp ult i64 %pieces.1, %args.1
  br i1 %_4, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_9 = add i64 %args.1, 1
  %_7 = icmp ugt i64 %pieces.1, %_9
  %0 = zext i1 %_7 to i8
  store i8 %0, ptr %_3, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_3, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %1 = load i8, ptr %_3, align 1, !range !4, !noundef !1
  %2 = trunc i8 %1 to i1
  br i1 %2, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
  store ptr null, ptr %_14, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %pieces.0, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %pieces.1, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8, !align !2, !noundef !1
  %7 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 1
  %8 = load i64, ptr %7, align 8
  %9 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 2
  %10 = getelementptr inbounds { ptr, i64 }, ptr %9, i32 0, i32 0
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds { ptr, i64 }, ptr %9, i32 0, i32 1
  store i64 %8, ptr %11, align 8
  %12 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 1
  %13 = getelementptr inbounds { ptr, i64 }, ptr %12, i32 0, i32 0
  store ptr %args.0, ptr %13, align 8
  %14 = getelementptr inbounds { ptr, i64 }, ptr %12, i32 0, i32 1
  store i64 %args.1, ptr %14, align 8
  ret void

bb4:                                              ; preds = %bb3
  store ptr null, ptr %_16, align 8
  %15 = getelementptr inbounds { ptr, i64 }, ptr %_12, i32 0, i32 0
  store ptr @alloc_560206a49c61adca6f3f0639a12632eb, ptr %15, align 8
  %16 = getelementptr inbounds { ptr, i64 }, ptr %_12, i32 0, i32 1
  store i64 1, ptr %16, align 8
  %17 = getelementptr inbounds { ptr, i64 }, ptr %_16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8, !align !2, !noundef !1
  %19 = getelementptr inbounds { ptr, i64 }, ptr %_16, i32 0, i32 1
  %20 = load i64, ptr %19, align 8
  %21 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_12, i32 0, i32 2
  %22 = getelementptr inbounds { ptr, i64 }, ptr %21, i32 0, i32 0
  store ptr %18, ptr %22, align 8
  %23 = getelementptr inbounds { ptr, i64 }, ptr %21, i32 0, i32 1
  store i64 %20, ptr %23, align 8
  %24 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_12, i32 0, i32 1
  %25 = getelementptr inbounds { ptr, i64 }, ptr %24, i32 0, i32 0
  store ptr @alloc_2a62ba4d4fa46537b277796d74f8c568, ptr %25, align 8
  %26 = getelementptr inbounds { ptr, i64 }, ptr %24, i32 0, i32 1
  store i64 0, ptr %26, align 8
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h34af6f3bf5ed0881E(ptr align 8 %_12, ptr align 8 @alloc_b3ea6872b8fe52b6826da5061f4dafb2) #12
  unreachable
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17h99cd451a0aeb18b3E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %0, i64 %1) unnamed_addr #0 {
start:
  %_2 = alloca { ptr, i64 }, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  store i64 %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !nonnull !1, !align !3, !noundef !1
  %6 = getelementptr inbounds { ptr, i64 }, ptr %_2, i32 0, i32 1
  %7 = load i64, ptr %6, align 8, !noundef !1
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17hda68c4f6018b3a39E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %5, i64 %7)
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h52415a62057d559aE"(ptr align 8 %_1) unnamed_addr #1 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h130325913571d53fE"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h130325913571d53fE"(ptr align 8 %_1) unnamed_addr #1 personality ptr @rust_eh_personality {
start:
  %0 = alloca { ptr, i32 }, align 8
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h06d10a5c961020a9E"(ptr align 8 %_1)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  invoke void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he4f7916713c39e37E"(ptr align 8 %_1) #13
          to label %bb1 unwind label %terminate

cleanup:                                          ; preds = %start
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  %3 = extractvalue { ptr, i32 } %1, 1
  %4 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 0
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  store i32 %3, ptr %5, align 8
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he4f7916713c39e37E"(ptr align 8 %_1)
  ret void

terminate:                                        ; preds = %bb3
  %6 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %7 = extractvalue { ptr, i32 } %6, 0
  %8 = extractvalue { ptr, i32 } %6, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17h5a873364aafedb6fE() #14
  unreachable

bb1:                                              ; preds = %bb3
  %9 = load ptr, ptr %0, align 8, !noundef !1
  %10 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  %11 = load i32, ptr %10, align 8, !noundef !1
  %12 = insertvalue { ptr, i32 } poison, ptr %9, 0
  %13 = insertvalue { ptr, i32 } %12, i32 %11, 1
  resume { ptr, i32 } %13
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17he4f7916713c39e37E"(ptr align 8 %_1) unnamed_addr #1 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4d091ab52a419404E"(ptr align 8 %_1)
  ret void
}

; core::alloc::layout::Layout::array::inner
; Function Attrs: inlinehint uwtable
define internal { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17h42505ae21b5c6502E(i64 %element_size, i64 %align, i64 %n) unnamed_addr #0 {
start:
  %_20 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_10 = alloca { i64, i64 }, align 8
  %_4 = alloca i8, align 1
  %_0 = alloca { i64, i64 }, align 8
  %0 = icmp eq i64 %element_size, 0
  br i1 %0, label %bb1, label %bb2

bb1:                                              ; preds = %start
  store i8 0, ptr %_4, align 1
  br label %bb3

bb2:                                              ; preds = %start
  store i64 %align, ptr %_15, align 8
  %_16 = load i64, ptr %_15, align 8, !range !5, !noundef !1
  %_17 = icmp uge i64 %_16, 1
  %_18 = icmp ule i64 %_16, -9223372036854775808
  %_19 = and i1 %_17, %_18
  call void @llvm.assume(i1 %_19)
  %_13 = sub i64 %_16, 1
  %_7 = sub i64 9223372036854775807, %_13
  %_8 = icmp eq i64 %element_size, 0
  %1 = call i1 @llvm.expect.i1(i1 %_8, i1 false)
  br i1 %1, label %panic, label %bb4

bb3:                                              ; preds = %bb4, %bb1
  %2 = load i8, ptr %_4, align 1, !range !4, !noundef !1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb5, label %bb6

bb4:                                              ; preds = %bb2
  %_6 = udiv i64 %_7, %element_size
  %_5 = icmp ugt i64 %n, %_6
  %4 = zext i1 %_5 to i8
  store i8 %4, ptr %_4, align 1
  br label %bb3

panic:                                            ; preds = %bb2
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h223b806fa72e0d8cE(ptr align 1 @str.0, i64 25, ptr align 8 @alloc_da2be1d7c9b8e626f47bd194c1756aaa) #12
  unreachable

bb6:                                              ; preds = %bb3
  %array_size = mul i64 %element_size, %n
  store i64 %align, ptr %_20, align 8
  %_21 = load i64, ptr %_20, align 8, !range !5, !noundef !1
  %_22 = icmp uge i64 %_21, 1
  %_23 = icmp ule i64 %_21, -9223372036854775808
  %_24 = and i1 %_22, %_23
  call void @llvm.assume(i1 %_24)
  %5 = getelementptr inbounds { i64, i64 }, ptr %_10, i32 0, i32 1
  store i64 %array_size, ptr %5, align 8
  store i64 %_21, ptr %_10, align 8
  %6 = getelementptr inbounds { i64, i64 }, ptr %_10, i32 0, i32 0
  %7 = load i64, ptr %6, align 8, !range !5, !noundef !1
  %8 = getelementptr inbounds { i64, i64 }, ptr %_10, i32 0, i32 1
  %9 = load i64, ptr %8, align 8, !noundef !1
  %10 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 0
  store i64 %7, ptr %10, align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 1
  store i64 %9, ptr %11, align 8
  br label %bb7

bb5:                                              ; preds = %bb3
  store i64 0, ptr %_0, align 8
  br label %bb7

bb7:                                              ; preds = %bb5, %bb6
  %12 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 0
  %13 = load i64, ptr %12, align 8, !range !6, !noundef !1
  %14 = getelementptr inbounds { i64, i64 }, ptr %_0, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = insertvalue { i64, i64 } poison, i64 %13, 0
  %17 = insertvalue { i64, i64 } %16, i64 %15, 1
  ret { i64, i64 } %17
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h1918470d9eec2f28E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %0, i64 %1, ptr align 8 %default) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %2 = alloca { ptr, i32 }, align 8
  %_10 = alloca i8, align 1
  %_9 = alloca i8, align 1
  %_7 = alloca { ptr, i64 }, align 8
  %self = alloca { ptr, i64 }, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  store i64 %1, ptr %4, align 8
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %5 = load ptr, ptr %self, align 8, !noundef !1
  %6 = ptrtoint ptr %5 to i64
  %7 = icmp eq i64 %6, 0
  %_4 = select i1 %7, i64 0, i64 1
  %8 = icmp eq i64 %_4, 0
  br i1 %8, label %bb1, label %bb3

bb1:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17he1c9dd48650b3879E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %default)
          to label %bb5 unwind label %cleanup

bb3:                                              ; preds = %start
  %9 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 0
  %t.0 = load ptr, ptr %9, align 8, !nonnull !1, !align !3, !noundef !1
  %10 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  %t.1 = load i64, ptr %10, align 8, !noundef !1
  store i8 0, ptr %_9, align 1
  %11 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 0
  store ptr %t.0, ptr %11, align 8
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 1
  store i64 %t.1, ptr %12, align 8
  %13 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8, !nonnull !1, !align !3, !noundef !1
  %15 = getelementptr inbounds { ptr, i64 }, ptr %_7, i32 0, i32 1
  %16 = load i64, ptr %15, align 8, !noundef !1
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17h99cd451a0aeb18b3E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %14, i64 %16)
          to label %bb4 unwind label %cleanup

bb14:                                             ; preds = %cleanup
  %17 = load i8, ptr %_9, align 1, !range !4, !noundef !1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %bb13, label %bb8

cleanup:                                          ; preds = %bb3, %bb1
  %19 = landingpad { ptr, i32 }
          cleanup
  %20 = extractvalue { ptr, i32 } %19, 0
  %21 = extractvalue { ptr, i32 } %19, 1
  %22 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 0
  store ptr %20, ptr %22, align 8
  %23 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  store i32 %21, ptr %23, align 8
  br label %bb14

bb5:                                              ; preds = %bb1
  br label %bb11

bb11:                                             ; preds = %bb4, %bb5
  %24 = load i8, ptr %_9, align 1, !range !4, !noundef !1
  %25 = trunc i8 %24 to i1
  br i1 %25, label %bb10, label %bb6

bb4:                                              ; preds = %bb3
  br label %bb11

bb6:                                              ; preds = %bb10, %bb11
  %26 = load i8, ptr %_10, align 1, !range !4, !noundef !1
  %27 = trunc i8 %26 to i1
  br i1 %27, label %bb12, label %bb7

bb10:                                             ; preds = %bb11
  br label %bb6

bb7:                                              ; preds = %bb12, %bb6
  ret void

bb12:                                             ; preds = %bb6
  br label %bb7

bb8:                                              ; preds = %bb13, %bb14
  %28 = load i8, ptr %_10, align 1, !range !4, !noundef !1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %bb15, label %bb9

bb13:                                             ; preds = %bb14
  br label %bb8

bb9:                                              ; preds = %bb15, %bb8
  %30 = load ptr, ptr %2, align 8, !noundef !1
  %31 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  %32 = load i32, ptr %31, align 8, !noundef !1
  %33 = insertvalue { ptr, i32 } poison, ptr %30, 0
  %34 = insertvalue { ptr, i32 } %33, i32 %32, 1
  resume { ptr, i32 } %34

bb15:                                             ; preds = %bb8
  br label %bb9

bb2:                                              ; No predecessors!
  unreachable
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h7ff1db6c4a36d42bE"(ptr sret(%"alloc::vec::Vec<u8>") align 8 %_0, ptr align 1 %s.0, i64 %s.1) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %0 = alloca { ptr, i32 }, align 8
  %v = alloca %"alloc::vec::Vec<u8>", align 8
; invoke alloc::raw_vec::RawVec<T,A>::allocate_in
  %1 = invoke { ptr, i64 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17ha1ba7edab34f4e4dE"(i64 %s.1, i1 zeroext false)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
  br i1 false, label %bb2, label %bb1

cleanup:                                          ; preds = %start
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  %4 = extractvalue { ptr, i32 } %2, 1
  %5 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 0
  store ptr %3, ptr %5, align 8
  %6 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  store i32 %4, ptr %6, align 8
  br label %bb3

bb4:                                              ; preds = %start
  %_11.0 = extractvalue { ptr, i64 } %1, 0
  %_11.1 = extractvalue { ptr, i64 } %1, 1
  %7 = getelementptr inbounds { ptr, i64 }, ptr %v, i32 0, i32 0
  store ptr %_11.0, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64 }, ptr %v, i32 0, i32 1
  store i64 %_11.1, ptr %8, align 8
  %9 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i64 0, ptr %9, align 8
  %self = load ptr, ptr %v, align 8, !nonnull !1, !noundef !1
  %10 = mul i64 %s.1, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %self, ptr align 1 %s.0, i64 %10, i1 false)
  %11 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i64 %s.1, ptr %11, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %v, i64 24, i1 false)
  ret void

bb1:                                              ; preds = %bb2, %bb3
  %12 = load ptr, ptr %0, align 8, !noundef !1
  %13 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  %14 = load i32, ptr %13, align 8, !noundef !1
  %15 = insertvalue { ptr, i32 } poison, ptr %12, 0
  %16 = insertvalue { ptr, i32 } %15, i32 %14, 1
  resume { ptr, i32 } %16

bb2:                                              ; preds = %bb3
  br label %bb1
}

; alloc::fmt::format
; Function Attrs: inlinehint uwtable
define internal void @_ZN5alloc3fmt6format17h89783e76bfeec888E(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %args) unnamed_addr #0 {
start:
  %_4 = alloca ptr, align 8
; call core::fmt::Arguments::as_str
  %0 = call { ptr, i64 } @_ZN4core3fmt9Arguments6as_str17h8c83f2b61acff4bdE(ptr align 8 %args)
  %_2.0 = extractvalue { ptr, i64 } %0, 0
  %_2.1 = extractvalue { ptr, i64 } %0, 1
  store ptr %args, ptr %_4, align 8
  %1 = load ptr, ptr %_4, align 8, !nonnull !1, !align !2, !noundef !1
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h1918470d9eec2f28E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %_2.0, i64 %_2.1, ptr align 8 %1)
  ret void
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17he1c9dd48650b3879E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %0) unnamed_addr #0 {
start:
  %_2 = alloca %"core::fmt::Arguments<'_>", align 8
  %_1 = alloca ptr, align 8
  store ptr %0, ptr %_1, align 8
  %_3 = load ptr, ptr %_1, align 8, !nonnull !1, !align !2, !noundef !1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_2, ptr align 8 %_3, i64 48, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17hd0fa1bd5fd11ecefE(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 8 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17hda68c4f6018b3a39E"(ptr sret(%"alloc::string::String") align 8 %_0, ptr align 1 %self.0, i64 %self.1) unnamed_addr #0 {
start:
  %bytes = alloca %"alloc::vec::Vec<u8>", align 8
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h7ff1db6c4a36d42bE"(ptr sret(%"alloc::vec::Vec<u8>") align 8 %bytes, ptr align 1 %self.0, i64 %self.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %bytes, i64 24, i1 false)
  ret void
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17hd369ff9c4c0d9385E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext %zeroed) unnamed_addr #0 {
start:
  %0 = alloca i8, align 1
  %_66 = alloca { ptr, i64 }, align 8
  %_65 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %_52 = alloca ptr, align 8
  %_45 = alloca i64, align 8
  %_36 = alloca i64, align 8
  %_31 = alloca { ptr, i64 }, align 8
  %_30 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %_18 = alloca i64, align 8
  %_14 = alloca { ptr, i64 }, align 8
  %self2 = alloca ptr, align 8
  %self1 = alloca ptr, align 8
  %_8 = alloca ptr, align 8
  %raw_ptr = alloca ptr, align 8
  %data = alloca ptr, align 8
  %_5 = alloca { ptr, i64 }, align 8
  %_0 = alloca { ptr, i64 }, align 8
  %1 = icmp eq i64 %layout.1, 0
  br i1 %1, label %bb2, label %bb1

bb2:                                              ; preds = %start
  store i64 %layout.0, ptr %_18, align 8
  %_19 = load i64, ptr %_18, align 8, !range !5, !noundef !1
  %_20 = icmp uge i64 %_19, 1
  %_21 = icmp ule i64 %_19, -9223372036854775808
  %_22 = and i1 %_20, %_21
  call void @llvm.assume(i1 %_22)
  %ptr = inttoptr i64 %_19 to ptr
  store ptr %ptr, ptr %data, align 8
  %_28 = load ptr, ptr %data, align 8, !noundef !1
  store ptr %_28, ptr %_31, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %_31, i32 0, i32 1
  store i64 0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64 }, ptr %_31, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8, !noundef !1
  %5 = getelementptr inbounds { ptr, i64 }, ptr %_31, i32 0, i32 1
  %6 = load i64, ptr %5, align 8, !noundef !1
  %7 = getelementptr inbounds { ptr, i64 }, ptr %_30, i32 0, i32 0
  store ptr %4, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_30, i32 0, i32 1
  store i64 %6, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_30, i32 0, i32 0
  %ptr.0 = load ptr, ptr %9, align 8, !noundef !1
  %10 = getelementptr inbounds { ptr, i64 }, ptr %_30, i32 0, i32 1
  %ptr.1 = load i64, ptr %10, align 8, !noundef !1
  %11 = getelementptr inbounds { ptr, i64 }, ptr %_5, i32 0, i32 0
  store ptr %ptr.0, ptr %11, align 8
  %12 = getelementptr inbounds { ptr, i64 }, ptr %_5, i32 0, i32 1
  store i64 %ptr.1, ptr %12, align 8
  %13 = getelementptr inbounds { ptr, i64 }, ptr %_5, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8, !nonnull !1, !noundef !1
  %15 = getelementptr inbounds { ptr, i64 }, ptr %_5, i32 0, i32 1
  %16 = load i64, ptr %15, align 8, !noundef !1
  %17 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %14, ptr %17, align 8
  %18 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %16, ptr %18, align 8
  br label %bb10

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb10:                                             ; preds = %bb9, %bb7, %bb2
  %19 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8, !noundef !1
  %21 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = insertvalue { ptr, i64 } poison, ptr %20, 0
  %24 = insertvalue { ptr, i64 } %23, i64 %22, 1
  ret { ptr, i64 } %24

bb4:                                              ; preds = %bb1
  %25 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %25, ptr %0, align 1
  %_41 = load i8, ptr %0, align 1, !noundef !1
  store i64 %layout.0, ptr %_45, align 8
  %_46 = load i64, ptr %_45, align 8, !range !5, !noundef !1
  %_47 = icmp uge i64 %_46, 1
  %_48 = icmp ule i64 %_46, -9223372036854775808
  %_49 = and i1 %_47, %_48
  call void @llvm.assume(i1 %_49)
  %26 = call ptr @__rust_alloc(i64 %layout.1, i64 %_46) #15
  store ptr %26, ptr %raw_ptr, align 8
  br label %bb5

bb3:                                              ; preds = %bb1
  store i64 %layout.0, ptr %_36, align 8
  %_37 = load i64, ptr %_36, align 8, !range !5, !noundef !1
  %_38 = icmp uge i64 %_37, 1
  %_39 = icmp ule i64 %_37, -9223372036854775808
  %_40 = and i1 %_38, %_39
  call void @llvm.assume(i1 %_40)
  %27 = call ptr @__rust_alloc_zeroed(i64 %layout.1, i64 %_37) #15
  store ptr %27, ptr %raw_ptr, align 8
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr3 = load ptr, ptr %raw_ptr, align 8, !noundef !1
  %_53 = ptrtoint ptr %ptr3 to i64
  %_51 = icmp eq i64 %_53, 0
  %_50 = xor i1 %_51, true
  br i1 %_50, label %bb14, label %bb15

bb15:                                             ; preds = %bb5
  store ptr null, ptr %self2, align 8
  br label %bb16

bb14:                                             ; preds = %bb5
  store ptr %ptr3, ptr %_52, align 8
  %28 = load ptr, ptr %_52, align 8, !nonnull !1, !noundef !1
  store ptr %28, ptr %self2, align 8
  br label %bb16

bb16:                                             ; preds = %bb14, %bb15
  %29 = load ptr, ptr %self2, align 8, !noundef !1
  %30 = ptrtoint ptr %29 to i64
  %31 = icmp eq i64 %30, 0
  %_57 = select i1 %31, i64 0, i64 1
  %32 = icmp eq i64 %_57, 0
  br i1 %32, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  store ptr null, ptr %self1, align 8
  br label %bb19

bb18:                                             ; preds = %bb16
  %v = load ptr, ptr %self2, align 8, !nonnull !1, !noundef !1
  store ptr %v, ptr %self1, align 8
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %33 = load ptr, ptr %self1, align 8, !noundef !1
  %34 = ptrtoint ptr %33 to i64
  %35 = icmp eq i64 %34, 0
  %_59 = select i1 %35, i64 1, i64 0
  %36 = icmp eq i64 %_59, 0
  br i1 %36, label %bb21, label %bb20

bb21:                                             ; preds = %bb19
  %v4 = load ptr, ptr %self1, align 8, !nonnull !1, !noundef !1
  store ptr %v4, ptr %_8, align 8
  br label %bb6

bb20:                                             ; preds = %bb19
  store ptr null, ptr %_8, align 8
  br label %bb6

bb6:                                              ; preds = %bb20, %bb21
  %37 = load ptr, ptr %_8, align 8, !noundef !1
  %38 = ptrtoint ptr %37 to i64
  %39 = icmp eq i64 %38, 0
  %_12 = select i1 %39, i64 1, i64 0
  %40 = icmp eq i64 %_12, 0
  br i1 %40, label %bb7, label %bb9

bb7:                                              ; preds = %bb6
  %ptr5 = load ptr, ptr %_8, align 8, !nonnull !1, !noundef !1
  store ptr %ptr5, ptr %_66, align 8
  %41 = getelementptr inbounds { ptr, i64 }, ptr %_66, i32 0, i32 1
  store i64 %layout.1, ptr %41, align 8
  %42 = getelementptr inbounds { ptr, i64 }, ptr %_66, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8, !noundef !1
  %44 = getelementptr inbounds { ptr, i64 }, ptr %_66, i32 0, i32 1
  %45 = load i64, ptr %44, align 8, !noundef !1
  %46 = getelementptr inbounds { ptr, i64 }, ptr %_65, i32 0, i32 0
  store ptr %43, ptr %46, align 8
  %47 = getelementptr inbounds { ptr, i64 }, ptr %_65, i32 0, i32 1
  store i64 %45, ptr %47, align 8
  %48 = getelementptr inbounds { ptr, i64 }, ptr %_65, i32 0, i32 0
  %ptr.06 = load ptr, ptr %48, align 8, !noundef !1
  %49 = getelementptr inbounds { ptr, i64 }, ptr %_65, i32 0, i32 1
  %ptr.17 = load i64, ptr %49, align 8, !noundef !1
  %50 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 0
  store ptr %ptr.06, ptr %50, align 8
  %51 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 1
  store i64 %ptr.17, ptr %51, align 8
  %52 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 0
  %53 = load ptr, ptr %52, align 8, !nonnull !1, !noundef !1
  %54 = getelementptr inbounds { ptr, i64 }, ptr %_14, i32 0, i32 1
  %55 = load i64, ptr %54, align 8, !noundef !1
  %56 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  store ptr %53, ptr %56, align 8
  %57 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %55, ptr %57, align 8
  br label %bb10

bb9:                                              ; preds = %bb6
  store ptr null, ptr %_0, align 8
  br label %bb10

bb8:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVec<T,A>::allocate_in
; Function Attrs: uwtable
define { ptr, i64 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17ha1ba7edab34f4e4dE"(i64 %capacity, i1 zeroext %0) unnamed_addr #1 personality ptr @rust_eh_personality {
start:
  %1 = alloca { ptr, i32 }, align 8
  %_43 = alloca ptr, align 8
  %_28 = alloca ptr, align 8
  %_27 = alloca ptr, align 8
  %self = alloca ptr, align 8
  %_22 = alloca ptr, align 8
  %result = alloca { ptr, i64 }, align 8
  %_11 = alloca { i64, i64 }, align 8
  %_7 = alloca { i64, i64 }, align 8
  %_4 = alloca i8, align 1
  %_0 = alloca { ptr, i64 }, align 8
  %alloc = alloca %"alloc::alloc::Global", align 1
  %init = alloca i8, align 1
  %2 = zext i1 %0 to i8
  store i8 %2, ptr %init, align 1
  br i1 false, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_5 = icmp eq i64 %capacity, 0
  %3 = zext i1 %_5 to i8
  store i8 %3, ptr %_4, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_4, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %4 = load i8, ptr %_4, align 1, !range !4, !noundef !1
  %5 = trunc i8 %4 to i1
  br i1 %5, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
; invoke core::alloc::layout::Layout::array::inner
  %6 = invoke { i64, i64 } @_ZN4core5alloc6layout6Layout5array5inner17h42505ae21b5c6502E(i64 1, i64 1, i64 %capacity)
          to label %bb22 unwind label %cleanup

bb4:                                              ; preds = %bb3
  store ptr inttoptr (i64 1 to ptr), ptr %_28, align 8
  %7 = load ptr, ptr %_28, align 8, !nonnull !1, !noundef !1
  store ptr %7, ptr %_27, align 8
  %8 = load ptr, ptr %_27, align 8, !nonnull !1, !noundef !1
  store ptr %8, ptr %_0, align 8
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 0, ptr %9, align 8
  br label %bb18

bb21:                                             ; preds = %cleanup
  br i1 true, label %bb20, label %bb19

cleanup:                                          ; preds = %bb6, %bb9, %bb16, %bb11, %bb12, %bb5
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = extractvalue { ptr, i32 } %10, 0
  %12 = extractvalue { ptr, i32 } %10, 1
  %13 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 0
  store ptr %11, ptr %13, align 8
  %14 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 1
  store i32 %12, ptr %14, align 8
  br label %bb21

bb22:                                             ; preds = %bb5
  store { i64, i64 } %6, ptr %_7, align 8
  %15 = load i64, ptr %_7, align 8, !range !6, !noundef !1
  %16 = icmp eq i64 %15, 0
  %_8 = select i1 %16, i64 1, i64 0
  %17 = icmp eq i64 %_8, 0
  br i1 %17, label %bb8, label %bb6

bb8:                                              ; preds = %bb22
  %18 = getelementptr inbounds { i64, i64 }, ptr %_7, i32 0, i32 0
  %layout.0 = load i64, ptr %18, align 8, !range !5, !noundef !1
  %19 = getelementptr inbounds { i64, i64 }, ptr %_7, i32 0, i32 1
  %layout.1 = load i64, ptr %19, align 8, !noundef !1
  store i64 -9223372036854775807, ptr %_11, align 8
  %20 = load i64, ptr %_11, align 8, !range !7, !noundef !1
  %21 = icmp eq i64 %20, -9223372036854775807
  %_13 = select i1 %21, i64 0, i64 1
  %22 = icmp eq i64 %_13, 0
  br i1 %22, label %bb10, label %bb9

bb6:                                              ; preds = %bb22
; invoke alloc::raw_vec::capacity_overflow
  invoke void @_ZN5alloc7raw_vec17capacity_overflow17h65f3963bb67633a2E() #12
          to label %unreachable unwind label %cleanup

bb10:                                             ; preds = %bb8
  %23 = load i8, ptr %init, align 1, !range !4, !noundef !1
  %24 = trunc i8 %23 to i1
  %_16 = zext i1 %24 to i64
  %25 = icmp eq i64 %_16, 0
  br i1 %25, label %bb12, label %bb11

bb9:                                              ; preds = %bb8
; invoke alloc::raw_vec::capacity_overflow
  invoke void @_ZN5alloc7raw_vec17capacity_overflow17h65f3963bb67633a2E() #12
          to label %unreachable unwind label %cleanup

bb12:                                             ; preds = %bb10
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %26 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h6dda7c4d6ca9b117E"(ptr align 1 %alloc, i64 %layout.0, i64 %layout.1)
          to label %bb13 unwind label %cleanup

bb11:                                             ; preds = %bb10
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %27 = invoke { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hd962ea8453d46d9aE"(ptr align 1 %alloc, i64 %layout.0, i64 %layout.1)
          to label %bb14 unwind label %cleanup

bb13:                                             ; preds = %bb12
  store { ptr, i64 } %26, ptr %result, align 8
  br label %bb15

bb15:                                             ; preds = %bb14, %bb13
  %28 = load ptr, ptr %result, align 8, !noundef !1
  %29 = ptrtoint ptr %28 to i64
  %30 = icmp eq i64 %29, 0
  %_19 = select i1 %30, i64 1, i64 0
  %31 = icmp eq i64 %_19, 0
  br i1 %31, label %bb17, label %bb16

bb14:                                             ; preds = %bb11
  store { ptr, i64 } %27, ptr %result, align 8
  br label %bb15

bb17:                                             ; preds = %bb15
  %32 = getelementptr inbounds { ptr, i64 }, ptr %result, i32 0, i32 0
  %ptr.0 = load ptr, ptr %32, align 8, !nonnull !1, !noundef !1
  %33 = getelementptr inbounds { ptr, i64 }, ptr %result, i32 0, i32 1
  %ptr.1 = load i64, ptr %33, align 8, !noundef !1
  store ptr %ptr.0, ptr %self, align 8
  %_42 = load ptr, ptr %self, align 8, !noundef !1
  store ptr %_42, ptr %_43, align 8
  %34 = load ptr, ptr %_43, align 8, !nonnull !1, !noundef !1
  store ptr %34, ptr %_22, align 8
  %35 = load ptr, ptr %_22, align 8, !nonnull !1, !noundef !1
  store ptr %35, ptr %_0, align 8
  %36 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  store i64 %capacity, ptr %36, align 8
  br label %bb18

bb16:                                             ; preds = %bb15
; invoke alloc::alloc::handle_alloc_error
  invoke void @_ZN5alloc5alloc18handle_alloc_error17h8539e700ad3e991eE(i64 %layout.0, i64 %layout.1) #12
          to label %unreachable unwind label %cleanup

bb18:                                             ; preds = %bb4, %bb17
  %37 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 0
  %38 = load ptr, ptr %37, align 8, !nonnull !1, !noundef !1
  %39 = getelementptr inbounds { ptr, i64 }, ptr %_0, i32 0, i32 1
  %40 = load i64, ptr %39, align 8, !noundef !1
  %41 = insertvalue { ptr, i64 } poison, ptr %38, 0
  %42 = insertvalue { ptr, i64 } %41, i64 %40, 1
  ret { ptr, i64 } %42

unreachable:                                      ; preds = %bb6, %bb9, %bb16
  unreachable

bb7:                                              ; No predecessors!
  unreachable

bb19:                                             ; preds = %bb20, %bb21
  %43 = load ptr, ptr %1, align 8, !noundef !1
  %44 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 1
  %45 = load i32, ptr %44, align 8, !noundef !1
  %46 = insertvalue { ptr, i32 } poison, ptr %43, 0
  %47 = insertvalue { ptr, i32 } %46, i32 %45, 1
  resume { ptr, i32 } %47

bb20:                                             ; preds = %bb21
  br label %bb19
}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: uwtable
define void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h04c35d4c689dbe55E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 8 %_0, ptr align 8 %self) unnamed_addr #1 {
start:
  %self2 = alloca ptr, align 8
  %self1 = alloca ptr, align 8
  %_11 = alloca ptr, align 8
  %_10 = alloca { ptr, { i64, i64 } }, align 8
  %layout = alloca { i64, i64 }, align 8
  %_2 = alloca i8, align 1
  br i1 false, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %0 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  %_4 = load i64, ptr %0, align 8, !noundef !1
  %_3 = icmp eq i64 %_4, 0
  %1 = zext i1 %_3 to i8
  store i8 %1, ptr %_2, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, ptr %_2, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %2 = load i8, ptr %_2, align 1, !range !4, !noundef !1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb4, label %bb5

bb5:                                              ; preds = %bb3
  %4 = getelementptr inbounds { ptr, i64 }, ptr %self, i32 0, i32 1
  %rhs = load i64, ptr %4, align 8, !noundef !1
  %size = mul nuw i64 1, %rhs
  %5 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  store i64 %size, ptr %5, align 8
  store i64 1, ptr %layout, align 8
  %self3 = load ptr, ptr %self, align 8, !nonnull !1, !noundef !1
  store ptr %self3, ptr %self1, align 8
  %_20 = load ptr, ptr %self1, align 8, !noundef !1
  store ptr %_20, ptr %self2, align 8
  %_25 = load ptr, ptr %self2, align 8, !noundef !1
  store ptr %_25, ptr %_11, align 8
  %6 = load ptr, ptr %_11, align 8, !nonnull !1, !noundef !1
  store ptr %6, ptr %_10, align 8
  %7 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 0
  %8 = load i64, ptr %7, align 8, !range !5, !noundef !1
  %9 = getelementptr inbounds { i64, i64 }, ptr %layout, i32 0, i32 1
  %10 = load i64, ptr %9, align 8, !noundef !1
  %11 = getelementptr inbounds { ptr, { i64, i64 } }, ptr %_10, i32 0, i32 1
  %12 = getelementptr inbounds { i64, i64 }, ptr %11, i32 0, i32 0
  store i64 %8, ptr %12, align 8
  %13 = getelementptr inbounds { i64, i64 }, ptr %11, i32 0, i32 1
  store i64 %10, ptr %13, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_10, i64 24, i1 false)
  br label %bb6

bb4:                                              ; preds = %bb3
  %14 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_0, i32 0, i32 1
  store i64 0, ptr %14, align 8
  br label %bb6

bb6:                                              ; preds = %bb4, %bb5
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h13ca1b388a3406a8E"(ptr align 1 %self, ptr %ptr, i64 %layout.0, i64 %layout.1) unnamed_addr #0 {
start:
  %_8 = alloca i64, align 8
  %0 = icmp eq i64 %layout.1, 0
  br i1 %0, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  store i64 %layout.0, ptr %_8, align 8
  %_9 = load i64, ptr %_8, align 8, !range !5, !noundef !1
  %_10 = icmp uge i64 %_9, 1
  %_11 = icmp ule i64 %_9, -9223372036854775808
  %_12 = and i1 %_10, %_11
  call void @llvm.assume(i1 %_12)
  call void @__rust_dealloc(ptr %ptr, i64 %layout.1, i64 %_9) #15
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17hd962ea8453d46d9aE"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17hd369ff9c4c0d9385E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext true)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint uwtable
define internal { ptr, i64 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h6dda7c4d6ca9b117E"(ptr align 1 %self, i64 %layout.0, i64 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i64 } @_ZN5alloc5alloc6Global10alloc_impl17hd369ff9c4c0d9385E(ptr align 1 %self, i64 %layout.0, i64 %layout.1, i1 zeroext false)
  %_0.0 = extractvalue { ptr, i64 } %0, 0
  %_0.1 = extractvalue { ptr, i64 } %0, 1
  %1 = insertvalue { ptr, i64 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i64 } %1, i64 %_0.1, 1
  ret { ptr, i64 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h06d10a5c961020a9E"(ptr align 8 %self) unnamed_addr #1 {
start:
  %_10 = alloca { ptr, i64 }, align 8
  %_9 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 8
  %self1 = load ptr, ptr %self, align 8, !nonnull !1, !noundef !1
  %0 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %self, i32 0, i32 1
  %len = load i64, ptr %0, align 8, !noundef !1
  store ptr %self1, ptr %_10, align 8
  %1 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 1
  store i64 %len, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8, !noundef !1
  %4 = getelementptr inbounds { ptr, i64 }, ptr %_10, i32 0, i32 1
  %5 = load i64, ptr %4, align 8, !noundef !1
  %6 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 0
  store ptr %3, ptr %6, align 8
  %7 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 1
  store i64 %5, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 0
  %_2.0 = load ptr, ptr %8, align 8, !noundef !1
  %9 = getelementptr inbounds { ptr, i64 }, ptr %_9, i32 0, i32 1
  %_2.1 = load i64, ptr %9, align 8, !noundef !1
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4d091ab52a419404E"(ptr align 8 %self) unnamed_addr #1 {
start:
  %_2 = alloca %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", align 8
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17h04c35d4c689dbe55E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 8 %_2, ptr align 8 %self)
  %0 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_2, i32 0, i32 1
  %1 = load i64, ptr %0, align 8, !range !6, !noundef !1
  %2 = icmp eq i64 %1, 0
  %_4 = select i1 %2, i64 0, i64 1
  %3 = icmp eq i64 %_4, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_2, align 8, !nonnull !1, !noundef !1
  %4 = getelementptr inbounds { ptr, { i64, i64 } }, ptr %_2, i32 0, i32 1
  %5 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 0
  %layout.0 = load i64, ptr %5, align 8, !range !5, !noundef !1
  %6 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 1
  %layout.1 = load i64, ptr %6, align 8, !noundef !1
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h13ca1b388a3406a8E"(ptr align 1 %self, ptr %ptr, i64 %layout.0, i64 %layout.1)
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void
}

; probe1::probe
; Function Attrs: uwtable
define void @_ZN6probe15probe17h8a9488033bf900a8E() unnamed_addr #1 {
start:
  %_0.i = alloca { ptr, ptr }, align 8
  %_7 = alloca [1 x { ptr, ptr }], align 8
  %_3 = alloca %"core::fmt::Arguments<'_>", align 8
  %res = alloca %"alloc::string::String", align 8
  %_1 = alloca %"alloc::string::String", align 8
  store ptr @alloc_53973d2fe29b4adba8bb7390b5678745, ptr %_0.i, align 8
  %0 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17hce31ab685c8ca7c1E", ptr %0, align 8
  %1 = load ptr, ptr %_0.i, align 8, !nonnull !1, !align !3, !noundef !1
  %2 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  %3 = load ptr, ptr %2, align 8, !nonnull !1, !noundef !1
  %4 = insertvalue { ptr, ptr } poison, ptr %1, 0
  %5 = insertvalue { ptr, ptr } %4, ptr %3, 1
  %_8.0 = extractvalue { ptr, ptr } %5, 0
  %_8.1 = extractvalue { ptr, ptr } %5, 1
  %6 = getelementptr inbounds [1 x { ptr, ptr }], ptr %_7, i64 0, i64 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  store ptr %_8.0, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %_8.1, ptr %8, align 8
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hadee2cabe50b2b86E(ptr sret(%"core::fmt::Arguments<'_>") align 8 %_3, ptr align 8 @alloc_ffa3cdb3ae88e54a1cc225f31dd07672, i64 1, ptr align 8 %_7, i64 1)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17h89783e76bfeec888E(ptr sret(%"alloc::string::String") align 8 %res, ptr align 8 %_3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_1, ptr align 8 %res, i64 24, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h52415a62057d559aE"(ptr align 8 %_1)
  ret void
}

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17hce31ab685c8ca7c1E"(ptr align 8, ptr align 8) unnamed_addr #1

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking9panic_fmt17h34af6f3bf5ed0881E(ptr align 8, ptr align 8) unnamed_addr #2

; Function Attrs: uwtable
declare i32 @rust_eh_personality(i32, i32, i64, ptr, ptr) unnamed_addr #1

; core::panicking::panic_cannot_unwind
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking19panic_cannot_unwind17h5a873364aafedb6fE() unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #5

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h223b806fa72e0d8cE(ptr align 1, i64, ptr align 8) unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; alloc::fmt::format::format_inner
; Function Attrs: uwtable
declare void @_ZN5alloc3fmt6format12format_inner17hd0fa1bd5fd11ecefE(ptr sret(%"alloc::string::String") align 8, ptr align 8) unnamed_addr #1

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc(i64, i64 allocalign) unnamed_addr #7

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc_zeroed(i64, i64 allocalign) unnamed_addr #8

; alloc::alloc::handle_alloc_error
; Function Attrs: cold noreturn uwtable
declare void @_ZN5alloc5alloc18handle_alloc_error17h8539e700ad3e991eE(i64, i64) unnamed_addr #9

; alloc::raw_vec::capacity_overflow
; Function Attrs: noreturn uwtable
declare void @_ZN5alloc7raw_vec17capacity_overflow17h65f3963bb67633a2E() unnamed_addr #10

; Function Attrs: nounwind allockind("free") uwtable
declare void @__rust_dealloc(ptr allocptr, i64, i64) unnamed_addr #11

attributes #0 = { inlinehint uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #1 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #2 = { cold noinline noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #3 = { cold noinline noreturn nounwind uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #8 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #9 = { cold noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #10 = { noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #11 = { nounwind allockind("free") uwtable "alloc-family"="__rust_alloc" "frame-pointer"="non-leaf" "target-cpu"="apple-m1" }
attributes #12 = { noreturn }
attributes #13 = { noinline }
attributes #14 = { noinline noreturn nounwind }
attributes #15 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{}
!2 = !{i64 8}
!3 = !{i64 1}
!4 = !{i8 0, i8 2}
!5 = !{i64 1, i64 -9223372036854775807}
!6 = !{i64 0, i64 -9223372036854775807}
!7 = !{i64 0, i64 -9223372036854775806}
