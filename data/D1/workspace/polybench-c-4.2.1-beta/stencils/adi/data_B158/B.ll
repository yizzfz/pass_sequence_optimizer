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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %..preheader_crit_edge ]
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
  br i1 %exitcond3, label %10, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %9
  br label %.preheader

; <label>:10:                                     ; preds = %9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge16..preheader4_crit_edge, %4
  %.0317 = phi i32 [ 1, %4 ], [ %140, %._crit_edge16..preheader4_crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %..lver.check_crit_edge, %.preheader4
  %indvar = phi i64 [ %5, %..lver.check_crit_edge ], [ 0, %.preheader4 ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %..lver.check_crit_edge ], [ 1, %.preheader4 ]
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

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
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
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial23 = load double, double* %scevgep17, align 8
  br label %36

; <label>:36:                                     ; preds = %._crit_edge49, %.ph
  %store_forwarded24 = phi double [ %load_initial23, %.ph ], [ %53, %._crit_edge49 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %41, %._crit_edge49 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge49 ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next4
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
  %51 = fmul double %store_forwarded24, 0xC09F400000000001
  %52 = fsub double %50, %51
  %53 = fdiv double %52, %40
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %53, double* %54, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge.loopexit48, label %._crit_edge49

._crit_edge49:                                    ; preds = %36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %36

._crit_edge.loopexit:                             ; preds = %.ph.lver.orig
  br label %._crit_edge

._crit_edge.loopexit48:                           ; preds = %36
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit48, %._crit_edge.loopexit
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %._crit_edge50, %._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge50 ], [ 998, %._crit_edge ]
  %57 = phi double [ %63, %._crit_edge50 ], [ 1.000000e+00, %._crit_edge ]
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %57
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %63, double* %64, align 8
  %65 = icmp sgt i64 %indvars.iv1, 1
  br i1 %65, label %._crit_edge50, label %66

._crit_edge50:                                    ; preds = %56
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  br label %56

; <label>:66:                                     ; preds = %56
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 999
  br i1 %exitcond12, label %.lver.check39.preheader, label %..lver.check_crit_edge

..lver.check_crit_edge:                           ; preds = %66
  br label %.lver.check

.lver.check39.preheader:                          ; preds = %66
  br label %.lver.check39

.lver.check39:                                    ; preds = %..lver.check39_crit_edge, %.lver.check39.preheader
  %indvar25 = phi i64 [ %67, %..lver.check39_crit_edge ], [ 0, %.lver.check39.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %..lver.check39_crit_edge ], [ 1, %.lver.check39.preheader ]
  %67 = add i64 %indvar25, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %2, i64 %67, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %67, i64 999
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %67, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %67, i64 999
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 0
  store double 1.000000e+00, double* %68, align 8
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %69, align 8
  %70 = bitcast double* %68 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %73 = bitcast [1000 x double]* %72 to i64*
  store i64 %71, i64* %73, align 8
  %74 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %bound035 = icmp ult double* %scevgep27, %scevgep33
  %bound136 = icmp ult double* %scevgep31, %scevgep29
  %memcheck.conflict38 = and i1 %bound035, %bound136
  br i1 %memcheck.conflict38, label %.ph40.lver.orig.preheader, label %.ph40

.ph40.lver.orig.preheader:                        ; preds = %.lver.check39
  br label %.ph40.lver.orig

.ph40.lver.orig:                                  ; preds = %.ph40.lver.orig..ph40.lver.orig_crit_edge, %.ph40.lver.orig.preheader
  %indvars.iv5.lver.orig = phi i64 [ %indvars.iv.next6.lver.orig, %.ph40.lver.orig..ph40.lver.orig_crit_edge ], [ 1, %.ph40.lver.orig.preheader ]
  %75 = add nsw i64 %indvars.iv5.lver.orig, -1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %75
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %74, i64 %indvars.iv5.lver.orig
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5.lver.orig
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %75
  %83 = insertelement <2 x double> undef, double %77, i32 0
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  %85 = fmul <2 x double> %84, <double 0xC08F400000000001, double 0xC08F400000000001>
  %86 = fadd <2 x double> %85, <double 0x409F440000000001, double 0x409F440000000001>
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fdiv double 0x408F400000000001, %87
  store double %89, double* %78, align 8
  %90 = load double, double* %79, align 8
  %91 = fmul double %90, 0xC09F400000000001
  %92 = load double, double* %80, align 8
  %93 = fmul double %92, 0xC0AF3E0000000001
  %94 = fsub double %93, %91
  %95 = load double, double* %81, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = fsub double %94, %96
  %98 = load double, double* %82, align 8
  %99 = fmul double %98, 0xC08F400000000001
  %100 = fsub double %97, %99
  %101 = fdiv double %100, %88
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %101, double* %102, align 8
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  br i1 %exitcond7.lver.orig, label %._crit_edge12.loopexit, label %.ph40.lver.orig..ph40.lver.orig_crit_edge

.ph40.lver.orig..ph40.lver.orig_crit_edge:        ; preds = %.ph40.lver.orig
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  br label %.ph40.lver.orig

.ph40:                                            ; preds = %.lver.check39
  %load_initial42 = load double, double* %scevgep27, align 8
  %load_initial45 = load double, double* %scevgep31, align 8
  br label %103

; <label>:103:                                    ; preds = %._crit_edge51, %.ph40
  %store_forwarded46 = phi double [ %load_initial45, %.ph40 ], [ %125, %._crit_edge51 ]
  %store_forwarded43 = phi double [ %load_initial42, %.ph40 ], [ %114, %._crit_edge51 ]
  %indvars.iv5 = phi i64 [ 1, %.ph40 ], [ %indvars.iv.next6, %._crit_edge51 ]
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %74, i64 %indvars.iv5
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5
  %108 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %109 = shufflevector <2 x double> %108, <2 x double> undef, <2 x i32> zeroinitializer
  %110 = fmul <2 x double> %109, <double 0xC08F400000000001, double 0xC08F400000000001>
  %111 = fadd <2 x double> %110, <double 0x409F440000000001, double 0x409F440000000001>
  %112 = extractelement <2 x double> %111, i32 0
  %113 = extractelement <2 x double> %111, i32 1
  %114 = fdiv double 0x408F400000000001, %112
  store double %114, double* %104, align 8
  %115 = load double, double* %105, align 8
  %116 = fmul double %115, 0xC09F400000000001
  %117 = load double, double* %106, align 8
  %118 = fmul double %117, 0xC0AF3E0000000001
  %119 = fsub double %118, %116
  %120 = load double, double* %107, align 8
  %121 = fmul double %120, 0xC09F400000000001
  %122 = fsub double %119, %121
  %123 = fmul double %store_forwarded46, 0xC08F400000000001
  %124 = fsub double %122, %123
  %125 = fdiv double %124, %113
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %125, double* %126, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  br i1 %exitcond7, label %._crit_edge12.loopexit47, label %._crit_edge51

._crit_edge51:                                    ; preds = %103
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %103

._crit_edge12.loopexit:                           ; preds = %.ph40.lver.orig
  br label %._crit_edge12

._crit_edge12.loopexit47:                         ; preds = %103
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit47, %._crit_edge12.loopexit
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %127, align 8
  br label %128

; <label>:128:                                    ; preds = %._crit_edge52, %._crit_edge12
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge52 ], [ 998, %._crit_edge12 ]
  %129 = phi double [ %135, %._crit_edge52 ], [ 1.000000e+00, %._crit_edge12 ]
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %129
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %135, double* %136, align 8
  %137 = icmp sgt i64 %indvars.iv8, 1
  br i1 %137, label %._crit_edge52, label %138

._crit_edge52:                                    ; preds = %128
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  br label %128

; <label>:138:                                    ; preds = %128
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 999
  br i1 %exitcond13, label %._crit_edge16, label %..lver.check39_crit_edge

..lver.check39_crit_edge:                         ; preds = %138
  br label %.lver.check39

._crit_edge16:                                    ; preds = %138
  %139 = icmp sgt i32 %.0317, 499
  br i1 %139, label %141, label %._crit_edge16..preheader4_crit_edge

._crit_edge16..preheader4_crit_edge:              ; preds = %._crit_edge16
  %140 = add nuw nsw i32 %.0317, 1
  br label %.preheader4

; <label>:141:                                    ; preds = %._crit_edge16
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
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge.._crit_edge4_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge4_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge4.._crit_edge_crit_edge

._crit_edge4.._crit_edge_crit_edge:               ; preds = %._crit_edge4
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %17
  br label %.preheader

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
