; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1000 x double]* nocapture) #2 {
.preheader.us.preheader:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5.us, %._crit_edge.us ]
  %2 = add i64 %indvars.iv6.us, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us.1, %4 ]
  %5 = sub nsw i64 0, %indvars.iv4.us
  %6 = trunc i64 %5 to i32
  %7 = add nsw i32 %3, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6.us, i64 %indvars.iv4.us
  %10 = trunc i64 %indvars.iv4.us to i32
  %11 = xor i32 %10, -1
  %12 = add nsw i32 %3, %11
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.000000e+03, double 1.000000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv4.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond9, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge34, %.preheader4.lr.ph
  %.0335 = phi i32 [ 1, %.preheader4.lr.ph ], [ %156, %._crit_edge34 ]
  br label %.lver.check

.lver.check:                                      ; preds = %.preheader4, %._crit_edge11.us
  %indvar = phi i64 [ 0, %.preheader4 ], [ %indvar.next, %._crit_edge11.us ]
  %indvars.iv13.us = phi i64 [ 1, %.preheader4 ], [ %15, %._crit_edge11.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv13.us
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv13.us, -1
  %15 = add nuw nsw i64 %indvars.iv13.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv6.us.lver.orig = phi i64 [ %indvars.iv.next.us.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv6.us.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, 0xC09F400000000001
  %20 = fadd double %19, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 %indvars.iv6.us.lver.orig
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv6.us.lver.orig, i64 %14
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv6.us.lver.orig, i64 %15
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %29, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us, i64 %16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fsub double %33, %36
  %38 = fdiv double %37, %20
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us, i64 %indvars.iv6.us.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.us.lver.orig = add nuw nsw i64 %indvars.iv6.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep51, align 8
  %load_initial53 = load double, double* %scevgep52, align 8
  br label %59

._crit_edge11.us:                                 ; preds = %.lr.ph10.us
  %40 = icmp slt i64 %15, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %40, label %.lver.check, label %.lver.check69.preheader

.lver.check69.preheader:                          ; preds = %._crit_edge11.us
  br label %.lver.check69

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge.us
  %indvars.iv8.us = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next7.us.1, %.lr.ph10.us ]
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 %indvars.iv8.us
  %42 = load double, double* %41, align 8
  %43 = or i64 %indvars.iv8.us, 1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %43, i64 %indvars.iv13.us
  %45 = load double, double* %44, align 8
  %46 = fmul double %42, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us, i64 %indvars.iv8.us
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv8.us, i64 %indvars.iv13.us
  store double %49, double* %50, align 8
  %indvars.iv.next7.us = add nsw i64 %indvars.iv8.us, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 %indvars.iv.next7.us
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us, i64 %indvars.iv.next7.us
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next7.us, i64 %indvars.iv13.us
  store double %56, double* %57, align 8
  %58 = icmp sgt i64 %indvars.iv.next7.us, 1
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv8.us, -2
  br i1 %58, label %.lr.ph10.us, label %._crit_edge11.us

; <label>:59:                                     ; preds = %59, %.ph
  %store_forwarded54 = phi double [ %load_initial53, %.ph ], [ %77, %59 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %62, %59 ]
  %indvars.iv6.us = phi i64 [ 1, %.ph ], [ %indvars.iv.next.us, %59 ]
  %60 = fmul double %store_forwarded, 0xC09F400000000001
  %61 = fadd double %60, 0x40AF420000000001
  %62 = fdiv double 0x409F400000000001, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13.us, i64 %indvars.iv6.us
  store double %62, double* %63, align 8
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv6.us, i64 %14
  %65 = bitcast double* %64 to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %65, align 8
  %67 = fmul <2 x double> %66, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fsub double %69, %68
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv6.us, i64 %15
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, 0xC08F400000000001
  %74 = fsub double %70, %73
  %75 = fmul double %store_forwarded54, 0xC09F400000000001
  %76 = fsub double %74, %75
  %77 = fdiv double %76, %61
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv13.us, i64 %indvars.iv6.us
  store double %77, double* %78, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %._crit_edge.us.loopexit78, label %59

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit78:                        ; preds = %59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit78, %._crit_edge.us.loopexit
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv13.us
  store double 1.000000e+00, double* %79, align 8
  br label %.lr.ph10.us

.lver.check69:                                    ; preds = %.lver.check69.preheader, %._crit_edge29.us
  %indvar55 = phi i64 [ %indvar.next56, %._crit_edge29.us ], [ 0, %.lver.check69.preheader ]
  %indvars.iv31.us = phi i64 [ %90, %._crit_edge29.us ], [ 1, %.lver.check69.preheader ]
  %80 = add i64 %indvar55, 1
  %81 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %81, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %4, i64 %81, i64 999
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %5, i64 %81, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 %81, i64 999
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31.us
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 0, i64 0
  store double 1.000000e+00, double* %83, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 0
  store double 0.000000e+00, double* %84, align 8
  %85 = bitcast [1000 x double]* %82 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us
  %88 = bitcast [1000 x double]* %87 to i64*
  store i64 %86, i64* %88, align 8
  %89 = add nsw i64 %indvars.iv31.us, -1
  %90 = add nuw nsw i64 %indvars.iv31.us, 1
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %.ph70.lver.orig.preheader, label %.ph70

.ph70.lver.orig.preheader:                        ; preds = %.lver.check69
  br label %.ph70.lver.orig

.ph70.lver.orig:                                  ; preds = %.ph70.lver.orig.preheader, %.ph70.lver.orig
  %indvars.iv21.us.lver.orig = phi i64 [ %indvars.iv.next17.us.lver.orig, %.ph70.lver.orig ], [ 1, %.ph70.lver.orig.preheader ]
  %91 = add nsw i64 %indvars.iv21.us.lver.orig, -1
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 %91
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC08F400000000001
  %95 = fadd double %94, 0x409F440000000001
  %96 = fdiv double 0x408F400000000001, %95
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 %indvars.iv21.us.lver.orig
  store double %96, double* %97, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %89, i64 %indvars.iv21.us.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31.us, i64 %indvars.iv21.us.lver.orig
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC0AF3E0000000001
  %104 = fsub double %103, %100
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %90, i64 %indvars.iv21.us.lver.orig
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 0xC09F400000000001
  %108 = fsub double %104, %107
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us, i64 %91
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, 0xC08F400000000001
  %112 = fsub double %108, %111
  %113 = fdiv double %112, %95
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us, i64 %indvars.iv21.us.lver.orig
  store double %113, double* %114, align 8
  %indvars.iv.next17.us.lver.orig = add nuw nsw i64 %indvars.iv21.us.lver.orig, 1
  %exitcond19.us.lver.orig = icmp eq i64 %indvars.iv.next17.us.lver.orig, 999
  br i1 %exitcond19.us.lver.orig, label %._crit_edge24.us.loopexit, label %.ph70.lver.orig

.ph70:                                            ; preds = %.lver.check69
  %scevgep74 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 0
  %load_initial72 = load double, double* %scevgep71, align 8
  %load_initial75 = load double, double* %scevgep74, align 8
  br label %134

._crit_edge29.us:                                 ; preds = %.lr.ph28.us
  %115 = icmp slt i64 %90, 999
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %115, label %.lver.check69, label %._crit_edge34

.lr.ph28.us:                                      ; preds = %.lr.ph28.us, %._crit_edge24.us
  %indvars.iv26.us = phi i64 [ 998, %._crit_edge24.us ], [ %indvars.iv.next25.us.1, %.lr.ph28.us ]
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 %indvars.iv26.us
  %117 = load double, double* %116, align 8
  %118 = or i64 %indvars.iv26.us, 1
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31.us, i64 %118
  %120 = load double, double* %119, align 8
  %121 = fmul double %117, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us, i64 %indvars.iv26.us
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31.us, i64 %indvars.iv26.us
  store double %124, double* %125, align 8
  %indvars.iv.next25.us = add nsw i64 %indvars.iv26.us, -1
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 %indvars.iv.next25.us
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, %124
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us, i64 %indvars.iv.next25.us
  %130 = load double, double* %129, align 8
  %131 = fadd double %128, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31.us, i64 %indvars.iv.next25.us
  store double %131, double* %132, align 8
  %133 = icmp sgt i64 %indvars.iv.next25.us, 1
  %indvars.iv.next25.us.1 = add nsw i64 %indvars.iv26.us, -2
  br i1 %133, label %.lr.ph28.us, label %._crit_edge29.us

; <label>:134:                                    ; preds = %134, %.ph70
  %store_forwarded76 = phi double [ %load_initial75, %.ph70 ], [ %152, %134 ]
  %store_forwarded73 = phi double [ %load_initial72, %.ph70 ], [ %137, %134 ]
  %indvars.iv21.us = phi i64 [ 1, %.ph70 ], [ %indvars.iv.next17.us, %134 ]
  %135 = fmul double %store_forwarded73, 0xC08F400000000001
  %136 = fadd double %135, 0x409F440000000001
  %137 = fdiv double 0x408F400000000001, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv31.us, i64 %indvars.iv21.us
  store double %137, double* %138, align 8
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %89, i64 %indvars.iv21.us
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, 0xC09F400000000001
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31.us, i64 %indvars.iv21.us
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, 0xC0AF3E0000000001
  %145 = fsub double %144, %141
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %90, i64 %indvars.iv21.us
  %147 = load double, double* %146, align 8
  %148 = fmul double %147, 0xC09F400000000001
  %149 = fsub double %145, %148
  %150 = fmul double %store_forwarded76, 0xC08F400000000001
  %151 = fsub double %149, %150
  %152 = fdiv double %151, %136
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31.us, i64 %indvars.iv21.us
  store double %152, double* %153, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv21.us, 1
  %exitcond19.us = icmp eq i64 %indvars.iv.next17.us, 999
  br i1 %exitcond19.us, label %._crit_edge24.us.loopexit77, label %134

._crit_edge24.us.loopexit:                        ; preds = %.ph70.lver.orig
  br label %._crit_edge24.us

._crit_edge24.us.loopexit77:                      ; preds = %134
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit77, %._crit_edge24.us.loopexit
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv31.us, i64 999
  store double 1.000000e+00, double* %154, align 8
  br label %.lr.ph28.us

._crit_edge34:                                    ; preds = %._crit_edge29.us
  %155 = icmp slt i32 %.0335, 500
  %156 = add nuw nsw i32 %.0335, 1
  br i1 %155, label %.preheader4, label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4.us, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5.us, 1000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv3.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %14 ]
  %8 = add nsw i64 %indvars.iv3.us, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5.us, i64 %indvars.iv3.us
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond8, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
