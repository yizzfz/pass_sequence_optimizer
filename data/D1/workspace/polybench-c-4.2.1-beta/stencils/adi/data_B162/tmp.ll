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
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
  br label %.preheader

.preheader:                                       ; preds = %9, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %9 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %3

; <label>:3:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  store double %7, double* %8, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %9, label %._crit_edge

._crit_edge:                                      ; preds = %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3

; <label>:9:                                      ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %10, label %.preheader

; <label>:10:                                     ; preds = %9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge164..preheader152_crit_edge, %4
  %.0165 = phi i32 [ 1, %4 ], [ %141, %._crit_edge164..preheader152_crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %..lver.check_crit_edge, %.preheader152
  %indvar = phi i64 [ %5, %..lver.check_crit_edge ], [ 0, %.preheader152 ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %..lver.check_crit_edge ], [ 1, %.preheader152 ]
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep15 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv3
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv3, -1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ult double* %scevgep17, %scevgep15
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %._crit_edge
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next4
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %13
  %.lhs.lver.orig = fmul double %15, 0xC09F400000000001
  %20 = fadd double %.lhs.lver.orig, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  store double %21, double* %16, align 8
  %22 = bitcast double* %17 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = load double, double* %18, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %27, %29
  %31 = load double, double* %19, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %30, %32
  %34 = fdiv double %33, %20
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge

._crit_edge:                                      ; preds = %.ph.lver.orig
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial23 = load double, double* %scevgep17, align 8
  br label %47

; <label>:36:                                     ; preds = %37
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 999
  br i1 %exitcond12, label %.lver.check39.preheader, label %..lver.check_crit_edge

.lver.check39.preheader:                          ; preds = %36
  br label %.lver.check39

..lver.check_crit_edge:                           ; preds = %36
  br label %.lver.check

; <label>:37:                                     ; preds = %._crit_edge47, %._crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge47 ], [ 998, %._crit_edge.us ]
  %38 = phi double [ %44, %._crit_edge47 ], [ 1.000000e+00, %._crit_edge.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %44, double* %45, align 8
  %46 = icmp sgt i64 %indvars.iv1, 1
  br i1 %46, label %._crit_edge47, label %36

._crit_edge47:                                    ; preds = %37
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  br label %37

; <label>:47:                                     ; preds = %._crit_edge49, %.ph
  %store_forwarded24 = phi double [ %load_initial23, %.ph ], [ %64, %._crit_edge49 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %52, %._crit_edge49 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge49 ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next4
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %51 = fadd double %.lhs, 0x40AF420000000001
  %52 = fdiv double 0x409F400000000001, %51
  store double %52, double* %48, align 8
  %53 = bitcast double* %49 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 8
  %55 = fmul <2 x double> %54, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = fsub double %57, %56
  %59 = load double, double* %50, align 8
  %60 = fmul double %59, 0xC08F400000000001
  %61 = fsub double %58, %60
  %62 = fmul double %store_forwarded24, 0xC09F400000000001
  %63 = fsub double %61, %62
  %64 = fdiv double %63, %51
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %64, double* %65, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge.us.loopexit55, label %._crit_edge49

._crit_edge49:                                    ; preds = %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %47

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %47
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %66, align 8
  br label %37

.lver.check39:                                    ; preds = %.lver.check39.preheader, %..lver.check39_crit_edge
  %indvar25 = phi i64 [ %67, %..lver.check39_crit_edge ], [ 0, %.lver.check39.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %..lver.check39_crit_edge ], [ 1, %.lver.check39.preheader ]
  %67 = add i64 %indvar25, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %2, i64 %67, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %67, i64 999
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %67, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %67, i64 999
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 0, i64 0
  store double 1.000000e+00, double* %69, align 8
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %70, align 8
  %71 = bitcast [1000 x double]* %68 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %74 = bitcast [1000 x double]* %73 to i64*
  store i64 %72, i64* %74, align 8
  %75 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %bound035 = icmp ult double* %scevgep27, %scevgep33
  %bound136 = icmp ult double* %scevgep31, %scevgep29
  %memcheck.conflict38 = and i1 %bound035, %bound136
  br i1 %memcheck.conflict38, label %.ph40.lver.orig.preheader, label %.ph40

.ph40.lver.orig.preheader:                        ; preds = %.lver.check39
  br label %.ph40.lver.orig

.ph40.lver.orig:                                  ; preds = %.ph40.lver.orig.preheader, %._crit_edge50
  %indvars.iv5.lver.orig = phi i64 [ %indvars.iv.next6.lver.orig, %._crit_edge50 ], [ 1, %.ph40.lver.orig.preheader ]
  %76 = add nsw i64 %indvars.iv5.lver.orig, -1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %76
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %75, i64 %indvars.iv5.lver.orig
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5.lver.orig
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %76
  %84 = insertelement <2 x double> undef, double %78, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = fmul <2 x double> %85, <double 0xC08F400000000001, double 0xC08F400000000001>
  %87 = fadd <2 x double> %86, <double 0x409F440000000001, double 0x409F440000000001>
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = fdiv double 0x408F400000000001, %88
  store double %90, double* %79, align 8
  %91 = load double, double* %80, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = load double, double* %81, align 8
  %94 = fmul double %93, 0xC0AF3E0000000001
  %95 = fsub double %94, %92
  %96 = load double, double* %82, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = fsub double %95, %97
  %99 = load double, double* %83, align 8
  %100 = fmul double %99, 0xC08F400000000001
  %101 = fsub double %98, %100
  %102 = fdiv double %101, %89
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %102, double* %103, align 8
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  br i1 %exitcond7.lver.orig, label %._crit_edge160.us.loopexit, label %._crit_edge50

._crit_edge50:                                    ; preds = %.ph40.lver.orig
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  br label %.ph40.lver.orig

.ph40:                                            ; preds = %.lver.check39
  %load_initial42 = load double, double* %scevgep27, align 8
  %load_initial45 = load double, double* %scevgep31, align 8
  br label %115

; <label>:104:                                    ; preds = %105
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 999
  br i1 %exitcond13, label %._crit_edge164, label %..lver.check39_crit_edge

..lver.check39_crit_edge:                         ; preds = %104
  br label %.lver.check39

; <label>:105:                                    ; preds = %._crit_edge51, %._crit_edge160.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge51 ], [ 998, %._crit_edge160.us ]
  %106 = phi double [ %112, %._crit_edge51 ], [ 1.000000e+00, %._crit_edge160.us ]
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %106
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %112, double* %113, align 8
  %114 = icmp sgt i64 %indvars.iv8, 1
  br i1 %114, label %._crit_edge51, label %104

._crit_edge51:                                    ; preds = %105
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  br label %105

; <label>:115:                                    ; preds = %._crit_edge53, %.ph40
  %store_forwarded46 = phi double [ %load_initial45, %.ph40 ], [ %137, %._crit_edge53 ]
  %store_forwarded43 = phi double [ %load_initial42, %.ph40 ], [ %126, %._crit_edge53 ]
  %indvars.iv5 = phi i64 [ 1, %.ph40 ], [ %indvars.iv.next6, %._crit_edge53 ]
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %75, i64 %indvars.iv5
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5
  %120 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %121 = shufflevector <2 x double> %120, <2 x double> undef, <2 x i32> zeroinitializer
  %122 = fmul <2 x double> %121, <double 0xC08F400000000001, double 0xC08F400000000001>
  %123 = fadd <2 x double> %122, <double 0x409F440000000001, double 0x409F440000000001>
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fdiv double 0x408F400000000001, %124
  store double %126, double* %116, align 8
  %127 = load double, double* %117, align 8
  %128 = fmul double %127, 0xC09F400000000001
  %129 = load double, double* %118, align 8
  %130 = fmul double %129, 0xC0AF3E0000000001
  %131 = fsub double %130, %128
  %132 = load double, double* %119, align 8
  %133 = fmul double %132, 0xC09F400000000001
  %134 = fsub double %131, %133
  %135 = fmul double %store_forwarded46, 0xC08F400000000001
  %136 = fsub double %134, %135
  %137 = fdiv double %136, %125
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %137, double* %138, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  br i1 %exitcond7, label %._crit_edge160.us.loopexit54, label %._crit_edge53

._crit_edge53:                                    ; preds = %115
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %115

._crit_edge160.us.loopexit:                       ; preds = %.ph40.lver.orig
  br label %._crit_edge160.us

._crit_edge160.us.loopexit54:                     ; preds = %115
  br label %._crit_edge160.us

._crit_edge160.us:                                ; preds = %._crit_edge160.us.loopexit54, %._crit_edge160.us.loopexit
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %139, align 8
  br label %105

._crit_edge164:                                   ; preds = %104
  %140 = icmp sgt i32 %.0165, 499
  br i1 %140, label %142, label %._crit_edge164..preheader152_crit_edge

._crit_edge164..preheader152_crit_edge:           ; preds = %._crit_edge164
  %141 = add nuw nsw i32 %.0165, 1
  br label %.preheader152

; <label>:142:                                    ; preds = %._crit_edge164
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
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge13
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge13

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

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
