; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge, %1
  %indvars.iv25 = phi i64 [ 0, %1 ], [ %indvars.iv.next3, %..preheader.preheader_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv25, 1000
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader..preheader_crit_edge ]
  %3 = sub nuw nsw i64 %2, %indvars.iv4
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %7 = sub nuw nsw i64 %2, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %14, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

; <label>:14:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond1, label %15, label %..preheader.preheader_crit_edge

..preheader.preheader_crit_edge:                  ; preds = %14
  br label %.preheader.preheader

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %..preheader4.preheader_crit_edge, %4
  %.0323 = phi i32 [ 1, %4 ], [ %165, %..preheader4.preheader_crit_edge ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4.._crit_edge.lver.check_crit_edge, %.preheader4.preheader
  %indvar = phi i64 [ %5, %.preheader4.._crit_edge.lver.check_crit_edge ], [ 0, %.preheader4.preheader ]
  %indvars.iv719 = phi i64 [ %13, %.preheader4.._crit_edge.lver.check_crit_edge ], [ 1, %.preheader4.preheader ]
  %5 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv719
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv719, -1
  %13 = add nuw nsw i64 %indvars.iv719, 1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge, %._crit_edge.lver.orig.preheader
  %indvars.iv17.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge ], [ 1, %._crit_edge.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv17.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 %indvars.iv17.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17.lver.orig, i64 %12
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17.lver.orig, i64 %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719, i64 %14
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = fmul <2 x double> %22, <double 0xC09F400000000001, double 0xC09F400000000001>
  %24 = fadd <2 x double> %23, <double 0x40AF420000000001, double 0x40AF420000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fdiv double 0x409F400000000001, %25
  store double %27, double* %17, align 8
  %28 = bitcast double* %18 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %28, align 8
  %30 = fmul <2 x double> %29, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %32, %31
  %34 = load double, double* %19, align 8
  %35 = fmul double %34, 0xC08F400000000001
  %36 = fsub double %33, %35
  %37 = load double, double* %20, align 8
  %38 = fmul double %37, 0xC09F400000000001
  %39 = fsub double %36, %38
  %40 = fdiv double %39, %26
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719, i64 %indvars.iv17.lver.orig
  store double %40, double* %41, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv17.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit35, label %._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge

._crit_edge.lver.orig.._crit_edge.lver.orig_crit_edge: ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial12 = load double, double* %scevgep6, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.ph
  %store_forwarded13 = phi double [ %load_initial12, %._crit_edge.ph ], [ %63, %._crit_edge.._crit_edge_crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %51, %._crit_edge.._crit_edge_crit_edge ]
  %indvars.iv17 = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 %indvars.iv17
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17, i64 %12
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17, i64 %13
  %45 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %46, <double 0xC09F400000000001, double 0xC09F400000000001>
  %48 = fadd <2 x double> %47, <double 0x40AF420000000001, double 0x40AF420000000001>
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %51 = fdiv double 0x409F400000000001, %49
  store double %51, double* %42, align 8
  %52 = bitcast double* %43 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fsub double %56, %55
  %58 = load double, double* %44, align 8
  %59 = fmul double %58, 0xC08F400000000001
  %60 = fsub double %57, %59
  %61 = fmul double %store_forwarded13, 0xC09F400000000001
  %62 = fsub double %60, %61
  %63 = fdiv double %62, %50
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719, i64 %indvars.iv17
  store double %63, double* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit36, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.loopexit35:                                      ; preds = %._crit_edge.lver.orig
  br label %65

.loopexit36:                                      ; preds = %._crit_edge
  br label %65

; <label>:65:                                     ; preds = %.loopexit36, %.loopexit35
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv719
  store double 1.000000e+00, double* %66, align 8
  br label %67

; <label>:67:                                     ; preds = %._crit_edge38, %65
  %indvars.iv518 = phi i64 [ 998, %65 ], [ %indvars.iv.next6.1, %._crit_edge38 ]
  %68 = phi double [ 1.000000e+00, %65 ], [ %81, %._crit_edge38 ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 %indvars.iv518
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %68
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719, i64 %indvars.iv518
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv518, i64 %indvars.iv719
  store double %74, double* %75, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv518, -1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv719, i64 %indvars.iv.next6
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %74
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv719, i64 %indvars.iv.next6
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next6, i64 %indvars.iv719
  store double %81, double* %82, align 8
  %83 = icmp sgt i64 %indvars.iv.next6, 1
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv518, -2
  br i1 %83, label %._crit_edge38, label %.preheader4

._crit_edge38:                                    ; preds = %67
  br label %67

.preheader4:                                      ; preds = %67
  %exitcond1 = icmp eq i64 %13, 999
  br i1 %exitcond1, label %._crit_edge25.lver.check.preheader, label %.preheader4.._crit_edge.lver.check_crit_edge

.preheader4.._crit_edge.lver.check_crit_edge:     ; preds = %.preheader4
  br label %._crit_edge.lver.check

._crit_edge25.lver.check.preheader:               ; preds = %.preheader4
  br label %._crit_edge25.lver.check

._crit_edge25.lver.check:                         ; preds = %.preheader.._crit_edge25.lver.check_crit_edge, %._crit_edge25.lver.check.preheader
  %indvar14 = phi i64 [ %84, %.preheader.._crit_edge25.lver.check_crit_edge ], [ 0, %._crit_edge25.lver.check.preheader ]
  %indvars.iv1522 = phi i64 [ %93, %.preheader.._crit_edge25.lver.check_crit_edge ], [ 1, %._crit_edge25.lver.check.preheader ]
  %84 = add nuw nsw i64 %indvar14, 1
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 0
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 999
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 0
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 999
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1522
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 0, i64 0
  store double 1.000000e+00, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 0
  store double 0.000000e+00, double* %87, align 8
  %88 = bitcast [1000 x double]* %85 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522
  %91 = bitcast [1000 x double]* %90 to i64*
  store i64 %89, i64* %91, align 8
  %92 = add nsw i64 %indvars.iv1522, -1
  %93 = add nuw nsw i64 %indvars.iv1522, 1
  %bound024 = icmp ult double* %scevgep16, %scevgep22
  %bound125 = icmp ult double* %scevgep20, %scevgep18
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %._crit_edge25.lver.orig.preheader, label %._crit_edge25.ph

._crit_edge25.lver.orig.preheader:                ; preds = %._crit_edge25.lver.check
  br label %._crit_edge25.lver.orig

._crit_edge25.lver.orig:                          ; preds = %._crit_edge25.lver.orig.._crit_edge25.lver.orig_crit_edge, %._crit_edge25.lver.orig.preheader
  %indvars.iv920.lver.orig = phi i64 [ %indvars.iv.next10.lver.orig, %._crit_edge25.lver.orig.._crit_edge25.lver.orig_crit_edge ], [ 1, %._crit_edge25.lver.orig.preheader ]
  %94 = add nsw i64 %indvars.iv920.lver.orig, -1
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %94
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv920.lver.orig
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %93, i64 %indvars.iv920.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %94
  %102 = insertelement <2 x double> undef, double %96, i32 0
  %103 = shufflevector <2 x double> %102, <2 x double> undef, <2 x i32> zeroinitializer
  %104 = fmul <2 x double> %103, <double 0xC08F400000000001, double 0xC08F400000000001>
  %105 = fadd <2 x double> %104, <double 0x409F440000000001, double 0x409F440000000001>
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fdiv double 0x408F400000000001, %106
  store double %108, double* %97, align 8
  %109 = load double, double* %98, align 8
  %110 = fmul double %109, 0xC09F400000000001
  %111 = load double, double* %99, align 8
  %112 = fmul double %111, 0xC0AF3E0000000001
  %113 = fsub double %112, %110
  %114 = load double, double* %100, align 8
  %115 = fmul double %114, 0xC09F400000000001
  %116 = fsub double %113, %115
  %117 = load double, double* %101, align 8
  %118 = fmul double %117, 0xC08F400000000001
  %119 = fsub double %116, %118
  %120 = fdiv double %119, %107
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  store double %120, double* %121, align 8
  %indvars.iv.next10.lver.orig = add nuw nsw i64 %indvars.iv920.lver.orig, 1
  %exitcond12.lver.orig = icmp eq i64 %indvars.iv.next10.lver.orig, 999
  br i1 %exitcond12.lver.orig, label %.loopexit, label %._crit_edge25.lver.orig.._crit_edge25.lver.orig_crit_edge

._crit_edge25.lver.orig.._crit_edge25.lver.orig_crit_edge: ; preds = %._crit_edge25.lver.orig
  br label %._crit_edge25.lver.orig

._crit_edge25.ph:                                 ; preds = %._crit_edge25.lver.check
  %load_initial29 = load double, double* %scevgep16, align 8
  %load_initial32 = load double, double* %scevgep20, align 8
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.._crit_edge25_crit_edge, %._crit_edge25.ph
  %store_forwarded33 = phi double [ %load_initial32, %._crit_edge25.ph ], [ %143, %._crit_edge25.._crit_edge25_crit_edge ]
  %store_forwarded30 = phi double [ %load_initial29, %._crit_edge25.ph ], [ %132, %._crit_edge25.._crit_edge25_crit_edge ]
  %indvars.iv920 = phi i64 [ 1, %._crit_edge25.ph ], [ %indvars.iv.next10, %._crit_edge25.._crit_edge25_crit_edge ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv920
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv920
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1522, i64 %indvars.iv920
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %93, i64 %indvars.iv920
  %126 = insertelement <2 x double> undef, double %store_forwarded30, i32 0
  %127 = shufflevector <2 x double> %126, <2 x double> undef, <2 x i32> zeroinitializer
  %128 = fmul <2 x double> %127, <double 0xC08F400000000001, double 0xC08F400000000001>
  %129 = fadd <2 x double> %128, <double 0x409F440000000001, double 0x409F440000000001>
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fdiv double 0x408F400000000001, %130
  store double %132, double* %122, align 8
  %133 = load double, double* %123, align 8
  %134 = fmul double %133, 0xC09F400000000001
  %135 = load double, double* %124, align 8
  %136 = fmul double %135, 0xC0AF3E0000000001
  %137 = fsub double %136, %134
  %138 = load double, double* %125, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = fsub double %137, %139
  %141 = fmul double %store_forwarded33, 0xC08F400000000001
  %142 = fsub double %140, %141
  %143 = fdiv double %142, %131
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv920
  store double %143, double* %144, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv920, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond12, label %.loopexit34, label %._crit_edge25.._crit_edge25_crit_edge

._crit_edge25.._crit_edge25_crit_edge:            ; preds = %._crit_edge25
  br label %._crit_edge25

.loopexit:                                        ; preds = %._crit_edge25.lver.orig
  br label %145

.loopexit34:                                      ; preds = %._crit_edge25
  br label %145

; <label>:145:                                    ; preds = %.loopexit34, %.loopexit
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1522, i64 999
  store double 1.000000e+00, double* %146, align 8
  br label %147

; <label>:147:                                    ; preds = %._crit_edge39, %145
  %indvars.iv1321 = phi i64 [ 998, %145 ], [ %indvars.iv.next14.1, %._crit_edge39 ]
  %148 = phi double [ 1.000000e+00, %145 ], [ %161, %._crit_edge39 ]
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv1321
  %150 = load double, double* %149, align 8
  %151 = fmul double %150, %148
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv1321
  %153 = load double, double* %152, align 8
  %154 = fadd double %151, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1522, i64 %indvars.iv1321
  store double %154, double* %155, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv1321, -1
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv.next14
  %157 = load double, double* %156, align 8
  %158 = fmul double %157, %154
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv.next14
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1522, i64 %indvars.iv.next14
  store double %161, double* %162, align 8
  %163 = icmp sgt i64 %indvars.iv.next14, 1
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1321, -2
  br i1 %163, label %._crit_edge39, label %.preheader

._crit_edge39:                                    ; preds = %147
  br label %147

.preheader:                                       ; preds = %147
  %exitcond2 = icmp eq i64 %93, 999
  br i1 %exitcond2, label %164, label %.preheader.._crit_edge25.lver.check_crit_edge

.preheader.._crit_edge25.lver.check_crit_edge:    ; preds = %.preheader
  br label %._crit_edge25.lver.check

; <label>:164:                                    ; preds = %.preheader
  %165 = add nuw nsw i32 %.0323, 1
  %exitcond37 = icmp eq i32 %165, 501
  br i1 %exitcond37, label %166, label %..preheader4.preheader_crit_edge

..preheader4.preheader_crit_edge:                 ; preds = %164
  br label %.preheader4.preheader

; <label>:166:                                    ; preds = %164
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge, %1
  %indvars.iv25 = phi i64 [ 0, %1 ], [ %indvars.iv.next3, %..preheader.preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv25, 1000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader..preheader._crit_edge_crit_edge, %.preheader.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader..preheader._crit_edge_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv4, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.preheader._crit_edge..preheader_crit_edge

.preheader._crit_edge..preheader_crit_edge:       ; preds = %.preheader._crit_edge
  br label %.preheader

; <label>:11:                                     ; preds = %.preheader._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge..preheader_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv4
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %.preheader..preheader._crit_edge_crit_edge

.preheader..preheader._crit_edge_crit_edge:       ; preds = %.preheader
  br label %.preheader._crit_edge

; <label>:17:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond1, label %18, label %..preheader.preheader_crit_edge

..preheader.preheader_crit_edge:                  ; preds = %17
  br label %.preheader.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
