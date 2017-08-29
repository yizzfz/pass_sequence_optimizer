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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %14, %1
  %indvars.iv26 = phi i64 [ 0, %1 ], [ %indvars.iv.next3, %14 ]
  %2 = add nuw nsw i64 %indvars.iv26, 1000
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %3 = sub nuw nsw i64 %2, %indvars.iv5
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %7 = sub nuw nsw i64 %2, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond4.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond4.1, label %14, label %.preheader

; <label>:14:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond, label %15, label %.preheader.preheader

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %154, %4
  %.0324 = phi i32 [ 1, %4 ], [ %156, %154 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4, %.preheader4.preheader
  %indvar = phi i64 [ %5, %.preheader4 ], [ 0, %.preheader4.preheader ]
  %indvars.iv720 = phi i64 [ %13, %.preheader4 ], [ 1, %.preheader4.preheader ]
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv720
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv720, -1
  %13 = add nuw nsw i64 %indvars.iv720, 1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv18.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 %indvars.iv18.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %12
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720, i64 %14
  %.lhs.lver.orig = fmul double %16, 0xC09F400000000001
  %21 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %22 = fdiv double 0x409F400000000001, %21
  store double %22, double* %17, align 8
  %23 = bitcast double* %18 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = load double, double* %19, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %28, %30
  %32 = load double, double* %20, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %31, %33
  %35 = fdiv double %34, %21
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720, i64 %indvars.iv18.lver.orig
  store double %35, double* %36, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond17.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond17.lver.orig, label %.loopexit35, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial12 = load double, double* %scevgep6, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded13 = phi double [ %load_initial12, %._crit_edge.ph ], [ %53, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %41, %._crit_edge ]
  %indvars.iv18 = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 %indvars.iv18
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %12
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %13
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %40 = fadd double %.lhs, 0x40AF420000000001
  %41 = fdiv double 0x409F400000000001, %40
  store double %41, double* %37, align 8
  %42 = bitcast double* %38 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %47 = fsub double %46, %45
  %48 = load double, double* %39, align 8
  %49 = fmul double %48, 0xC08F400000000001
  %50 = fsub double %47, %49
  %51 = fmul double %store_forwarded13, 0xC09F400000000001
  %52 = fsub double %50, %51
  %53 = fdiv double %52, %40
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720, i64 %indvars.iv18
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond17, label %.loopexit36, label %._crit_edge

.loopexit35:                                      ; preds = %._crit_edge.lver.orig
  br label %55

.loopexit36:                                      ; preds = %._crit_edge
  br label %55

; <label>:55:                                     ; preds = %.loopexit36, %.loopexit35
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv720
  store double 1.000000e+00, double* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %57, %55
  %58 = phi double [ 1.000000e+00, %55 ], [ %71, %57 ]
  %indvars.iv519 = phi i64 [ 998, %55 ], [ %indvars.iv.next6.1, %57 ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 %indvars.iv519
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %58
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720, i64 %indvars.iv519
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv519, i64 %indvars.iv720
  store double %64, double* %65, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv519, -1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv720, i64 %indvars.iv.next6
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %64
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv720, i64 %indvars.iv.next6
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next6, i64 %indvars.iv720
  store double %71, double* %72, align 8
  %73 = icmp sgt i64 %indvars.iv.next6, 1
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv519, -2
  br i1 %73, label %57, label %.preheader4

.preheader4:                                      ; preds = %57
  %exitcond1 = icmp eq i64 %13, 999
  br i1 %exitcond1, label %._crit_edge26.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge26.lver.check.preheader:               ; preds = %.preheader4
  br label %._crit_edge26.lver.check

._crit_edge26.lver.check:                         ; preds = %._crit_edge26.lver.check.preheader, %.preheader
  %indvar14 = phi i64 [ %74, %.preheader ], [ 0, %._crit_edge26.lver.check.preheader ]
  %indvars.iv1523 = phi i64 [ %83, %.preheader ], [ 1, %._crit_edge26.lver.check.preheader ]
  %74 = add i64 %indvar14, 1
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 0
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 999
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 0
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1523
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 0, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast [1000 x double]* %75 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv1523, -1
  %83 = add nuw nsw i64 %indvars.iv1523, 1
  %bound024 = icmp ult double* %scevgep16, %scevgep22
  %bound125 = icmp ult double* %scevgep20, %scevgep18
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %._crit_edge26.lver.orig.preheader, label %._crit_edge26.ph

._crit_edge26.lver.orig.preheader:                ; preds = %._crit_edge26.lver.check
  br label %._crit_edge26.lver.orig

._crit_edge26.lver.orig:                          ; preds = %._crit_edge26.lver.orig.preheader, %._crit_edge26.lver.orig
  %indvars.iv921.lver.orig = phi i64 [ %indvars.iv.next10.lver.orig, %._crit_edge26.lver.orig ], [ 1, %._crit_edge26.lver.orig.preheader ]
  %84 = add nsw i64 %indvars.iv921.lver.orig, -1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 %84
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 %indvars.iv921.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv921.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1523, i64 %indvars.iv921.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv921.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523, i64 %84
  %92 = insertelement <2 x double> undef, double %86, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %93, <double 0xC08F400000000001, double 0xC08F400000000001>
  %95 = fadd <2 x double> %94, <double 0x409F440000000001, double 0x409F440000000001>
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fdiv double 0x408F400000000001, %96
  store double %98, double* %87, align 8
  %99 = load double, double* %88, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = load double, double* %89, align 8
  %102 = fmul double %101, 0xC0AF3E0000000001
  %103 = fsub double %102, %100
  %104 = load double, double* %90, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = fsub double %103, %105
  %107 = load double, double* %91, align 8
  %108 = fmul double %107, 0xC08F400000000001
  %109 = fsub double %106, %108
  %110 = fdiv double %109, %97
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523, i64 %indvars.iv921.lver.orig
  store double %110, double* %111, align 8
  %indvars.iv.next10.lver.orig = add nuw nsw i64 %indvars.iv921.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next10.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit, label %._crit_edge26.lver.orig

._crit_edge26.ph:                                 ; preds = %._crit_edge26.lver.check
  %load_initial29 = load double, double* %scevgep16, align 8
  %load_initial32 = load double, double* %scevgep20, align 8
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26, %._crit_edge26.ph
  %store_forwarded33 = phi double [ %load_initial32, %._crit_edge26.ph ], [ %133, %._crit_edge26 ]
  %store_forwarded30 = phi double [ %load_initial29, %._crit_edge26.ph ], [ %122, %._crit_edge26 ]
  %indvars.iv921 = phi i64 [ 1, %._crit_edge26.ph ], [ %indvars.iv.next10, %._crit_edge26 ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 %indvars.iv921
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %82, i64 %indvars.iv921
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1523, i64 %indvars.iv921
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv921
  %116 = insertelement <2 x double> undef, double %store_forwarded30, i32 0
  %117 = shufflevector <2 x double> %116, <2 x double> undef, <2 x i32> zeroinitializer
  %118 = fmul <2 x double> %117, <double 0xC08F400000000001, double 0xC08F400000000001>
  %119 = fadd <2 x double> %118, <double 0x409F440000000001, double 0x409F440000000001>
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fdiv double 0x408F400000000001, %120
  store double %122, double* %112, align 8
  %123 = load double, double* %113, align 8
  %124 = fmul double %123, 0xC09F400000000001
  %125 = load double, double* %114, align 8
  %126 = fmul double %125, 0xC0AF3E0000000001
  %127 = fsub double %126, %124
  %128 = load double, double* %115, align 8
  %129 = fmul double %128, 0xC09F400000000001
  %130 = fsub double %127, %129
  %131 = fmul double %store_forwarded33, 0xC08F400000000001
  %132 = fsub double %130, %131
  %133 = fdiv double %132, %121
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523, i64 %indvars.iv921
  store double %133, double* %134, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv921, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond, label %.loopexit34, label %._crit_edge26

.loopexit:                                        ; preds = %._crit_edge26.lver.orig
  br label %135

.loopexit34:                                      ; preds = %._crit_edge26
  br label %135

; <label>:135:                                    ; preds = %.loopexit34, %.loopexit
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1523, i64 999
  store double 1.000000e+00, double* %136, align 8
  br label %137

; <label>:137:                                    ; preds = %137, %135
  %138 = phi double [ 1.000000e+00, %135 ], [ %151, %137 ]
  %indvars.iv1322 = phi i64 [ 998, %135 ], [ %indvars.iv.next14.1, %137 ]
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 %indvars.iv1322
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, %138
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523, i64 %indvars.iv1322
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1523, i64 %indvars.iv1322
  store double %144, double* %145, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv1322, -1
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1523, i64 %indvars.iv.next14
  %147 = load double, double* %146, align 8
  %148 = fmul double %147, %144
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1523, i64 %indvars.iv.next14
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1523, i64 %indvars.iv.next14
  store double %151, double* %152, align 8
  %153 = icmp sgt i64 %indvars.iv.next14, 1
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1322, -2
  br i1 %153, label %137, label %.preheader

.preheader:                                       ; preds = %137
  %exitcond2 = icmp eq i64 %83, 999
  br i1 %exitcond2, label %154, label %._crit_edge26.lver.check

; <label>:154:                                    ; preds = %.preheader
  %155 = icmp sgt i32 %.0324, 499
  %156 = add nuw nsw i32 %.0324, 1
  br i1 %155, label %157, label %.preheader4.preheader

; <label>:157:                                    ; preds = %154
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %17, %1
  %indvars.iv26 = phi i64 [ 0, %1 ], [ %indvars.iv.next3, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %7 = add nuw nsw i64 %indvars.iv5, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.preheader

; <label>:11:                                     ; preds = %.preheader._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv5
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond4, label %17, label %.preheader._crit_edge

; <label>:17:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond, label %18, label %.preheader.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
