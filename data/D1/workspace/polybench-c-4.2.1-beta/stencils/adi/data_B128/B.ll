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
  br label %.preheader

.preheader:                                       ; preds = %15, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %15 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge16, %4
  %.0317 = phi i32 [ 1, %4 ], [ %157, %._crit_edge16 ]
  br label %.lver.check

.lver.check:                                      ; preds = %37, %.preheader4
  %indvar = phi i64 [ %5, %37 ], [ 0, %.preheader4 ]
  %indvars.iv3 = phi i64 [ %13, %37 ], [ 1, %.preheader4 ]
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
  %13 = add nuw nsw i64 %indvars.iv3, 1
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ult double* %scevgep17, %scevgep15
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %14
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
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial23 = load double, double* %scevgep17, align 8
  br label %55

; <label>:37:                                     ; preds = %38
  %exitcond12 = icmp eq i64 %13, 999
  br i1 %exitcond12, label %.lver.check39.preheader, label %.lver.check

.lver.check39.preheader:                          ; preds = %37
  br label %.lver.check39

; <label>:38:                                     ; preds = %38, %._crit_edge.us
  %39 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %52, %38 ]
  %indvars.iv1 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next2.1, %38 ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %39
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %45, double* %46, align 8
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next2
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %45
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.next2
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next2, i64 %indvars.iv3
  store double %52, double* %53, align 8
  %54 = icmp sgt i64 %indvars.iv.next2, 1
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, -2
  br i1 %54, label %38, label %37

; <label>:55:                                     ; preds = %55, %.ph
  %store_forwarded24 = phi double [ %load_initial23, %.ph ], [ %72, %55 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %60, %55 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %55 ]
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %13
  %.lhs = fmul double %store_forwarded, 0xC09F400000000001
  %59 = fadd double %.lhs, 0x40AF420000000001
  %60 = fdiv double 0x409F400000000001, %59
  store double %60, double* %56, align 8
  %61 = bitcast double* %57 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %63 = fmul <2 x double> %62, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fsub double %65, %64
  %67 = load double, double* %58, align 8
  %68 = fmul double %67, 0xC08F400000000001
  %69 = fsub double %66, %68
  %70 = fmul double %store_forwarded24, 0xC09F400000000001
  %71 = fsub double %69, %70
  %72 = fdiv double %71, %59
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %72, double* %73, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit48, label %55

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit48:                        ; preds = %55
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit48, %._crit_edge.us.loopexit
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %74, align 8
  br label %38

.lver.check39:                                    ; preds = %.lver.check39.preheader, %113
  %indvar25 = phi i64 [ %75, %113 ], [ 0, %.lver.check39.preheader ]
  %indvars.iv10 = phi i64 [ %84, %113 ], [ 1, %.lver.check39.preheader ]
  %75 = add i64 %indvar25, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 999
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 0, i64 0
  store double 1.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %78, align 8
  %79 = bitcast [1000 x double]* %76 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %82 = bitcast [1000 x double]* %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = add nsw i64 %indvars.iv10, -1
  %84 = add nuw nsw i64 %indvars.iv10, 1
  %bound035 = icmp ult double* %scevgep27, %scevgep33
  %bound136 = icmp ult double* %scevgep31, %scevgep29
  %memcheck.conflict38 = and i1 %bound035, %bound136
  br i1 %memcheck.conflict38, label %.ph40.lver.orig.preheader, label %.ph40

.ph40.lver.orig.preheader:                        ; preds = %.lver.check39
  br label %.ph40.lver.orig

.ph40.lver.orig:                                  ; preds = %.ph40.lver.orig.preheader, %.ph40.lver.orig
  %indvars.iv5.lver.orig = phi i64 [ %indvars.iv.next6.lver.orig, %.ph40.lver.orig ], [ 1, %.ph40.lver.orig.preheader ]
  %85 = add nsw i64 %indvars.iv5.lver.orig, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %85
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv5.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv5.lver.orig
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %85
  %93 = insertelement <2 x double> undef, double %87, i32 0
  %94 = shufflevector <2 x double> %93, <2 x double> undef, <2 x i32> zeroinitializer
  %95 = fmul <2 x double> %94, <double 0xC08F400000000001, double 0xC08F400000000001>
  %96 = fadd <2 x double> %95, <double 0x409F440000000001, double 0x409F440000000001>
  %97 = extractelement <2 x double> %96, i32 0
  %98 = extractelement <2 x double> %96, i32 1
  %99 = fdiv double 0x408F400000000001, %97
  store double %99, double* %88, align 8
  %100 = load double, double* %89, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = load double, double* %90, align 8
  %103 = fmul double %102, 0xC0AF3E0000000001
  %104 = fsub double %103, %101
  %105 = load double, double* %91, align 8
  %106 = fmul double %105, 0xC09F400000000001
  %107 = fsub double %104, %106
  %108 = load double, double* %92, align 8
  %109 = fmul double %108, 0xC08F400000000001
  %110 = fsub double %107, %109
  %111 = fdiv double %110, %98
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %111, double* %112, align 8
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  br i1 %exitcond7.lver.orig, label %._crit_edge12.us.loopexit, label %.ph40.lver.orig

.ph40:                                            ; preds = %.lver.check39
  %load_initial42 = load double, double* %scevgep27, align 8
  %load_initial45 = load double, double* %scevgep31, align 8
  br label %131

; <label>:113:                                    ; preds = %114
  %exitcond13 = icmp eq i64 %84, 999
  br i1 %exitcond13, label %._crit_edge16, label %.lver.check39

; <label>:114:                                    ; preds = %114, %._crit_edge12.us
  %115 = phi double [ 1.000000e+00, %._crit_edge12.us ], [ %128, %114 ]
  %indvars.iv8 = phi i64 [ 998, %._crit_edge12.us ], [ %indvars.iv.next9.1, %114 ]
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, %115
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %121, double* %122, align 8
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next9
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, %121
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.next9
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9
  store double %128, double* %129, align 8
  %130 = icmp sgt i64 %indvars.iv.next9, 1
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, -2
  br i1 %130, label %114, label %113

; <label>:131:                                    ; preds = %131, %.ph40
  %store_forwarded46 = phi double [ %load_initial45, %.ph40 ], [ %153, %131 ]
  %store_forwarded43 = phi double [ %load_initial42, %.ph40 ], [ %142, %131 ]
  %indvars.iv5 = phi i64 [ 1, %.ph40 ], [ %indvars.iv.next6, %131 ]
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv5
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv5
  %136 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %137 = shufflevector <2 x double> %136, <2 x double> undef, <2 x i32> zeroinitializer
  %138 = fmul <2 x double> %137, <double 0xC08F400000000001, double 0xC08F400000000001>
  %139 = fadd <2 x double> %138, <double 0x409F440000000001, double 0x409F440000000001>
  %140 = extractelement <2 x double> %139, i32 0
  %141 = extractelement <2 x double> %139, i32 1
  %142 = fdiv double 0x408F400000000001, %140
  store double %142, double* %132, align 8
  %143 = load double, double* %133, align 8
  %144 = fmul double %143, 0xC09F400000000001
  %145 = load double, double* %134, align 8
  %146 = fmul double %145, 0xC0AF3E0000000001
  %147 = fsub double %146, %144
  %148 = load double, double* %135, align 8
  %149 = fmul double %148, 0xC09F400000000001
  %150 = fsub double %147, %149
  %151 = fmul double %store_forwarded46, 0xC08F400000000001
  %152 = fsub double %150, %151
  %153 = fdiv double %152, %141
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %153, double* %154, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br i1 %exitcond7, label %._crit_edge12.us.loopexit47, label %131

._crit_edge12.us.loopexit:                        ; preds = %.ph40.lver.orig
  br label %._crit_edge12.us

._crit_edge12.us.loopexit47:                      ; preds = %131
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit47, %._crit_edge12.us.loopexit
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %155, align 8
  br label %114

._crit_edge16:                                    ; preds = %113
  %156 = icmp sgt i32 %.0317, 499
  %157 = add nuw nsw i32 %.0317, 1
  br i1 %156, label %158, label %.preheader4

; <label>:158:                                    ; preds = %._crit_edge16
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

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

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
