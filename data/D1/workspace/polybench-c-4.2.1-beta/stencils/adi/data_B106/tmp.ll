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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge:
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge
  %indvars.iv17.us = phi i64 [ 0, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge ], [ %indvars.iv.next16.us, %._crit_edge._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv17.us, 1000
  %3 = trunc i64 %2 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.us.1, %._crit_edge.us ]
  %4 = sub nsw i64 0, %indvars.iv15.us
  %5 = trunc i64 %4 to i32
  %6 = add nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv17.us, i64 %indvars.iv15.us
  %9 = trunc i64 %indvars.iv15.us to i32
  %10 = xor i32 %9, -1
  %11 = add nsw i32 %3, %10
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv15.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16.us, 1000
  br i1 %exitcond20, label %._crit_edge19, label %._crit_edge.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge152._crit_edge, %._crit_edge.preheader.lr.ph
  %.0183 = phi i32 [ 1, %._crit_edge.preheader.lr.ph ], [ %152, %._crit_edge152._crit_edge ]
  br label %._crit_edge185.lver.check

._crit_edge185.lver.check:                        ; preds = %._crit_edge.us, %._crit_edge.preheader
  %indvar = phi i64 [ 0, %._crit_edge.preheader ], [ %6, %._crit_edge.us ]
  %indvars.iv163.us = phi i64 [ 1, %._crit_edge.preheader ], [ %14, %._crit_edge.us ]
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep189 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 999
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep193 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv163.us
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv163.us, -1
  %14 = add nuw nsw i64 %indvars.iv163.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep193
  %bound1 = icmp ult double* %scevgep191, %scevgep189
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge185.lver.orig.preheader, label %._crit_edge185.ph

._crit_edge185.lver.orig.preheader:               ; preds = %._crit_edge185.lver.check
  br label %._crit_edge185.lver.orig

._crit_edge185.lver.orig:                         ; preds = %._crit_edge185.lver.orig.preheader, %._crit_edge185.lver.orig
  %indvars.iv154.us.lver.orig = phi i64 [ %indvars.iv.next.us.lver.orig, %._crit_edge185.lver.orig ], [ 1, %._crit_edge185.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv154.us.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 %indvars.iv154.us.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv154.us.lver.orig, i64 %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv154.us.lver.orig, i64 %14
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us, i64 %15
  %.rhs.lver.orig = fmul double %17, 0xC09F400000000001
  %22 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %23 = fdiv double 0x409F400000000001, %22
  store double %23, double* %18, align 8
  %24 = bitcast double* %19 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fadd double %27, %28
  %30 = load double, double* %20, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %29, %31
  %33 = load double, double* %21, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %32, %34
  %36 = fdiv double %35, %22
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us, i64 %indvars.iv154.us.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.us.lver.orig = add nuw nsw i64 %indvars.iv154.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %._crit_edge156.us.loopexit, label %._crit_edge185.lver.orig

._crit_edge185.ph:                                ; preds = %._crit_edge185.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial197 = load double, double* %scevgep191, align 8
  br label %._crit_edge185

._crit_edge.us:                                   ; preds = %.lr.ph160.us
  %exitcond = icmp eq i64 %14, 999
  br i1 %exitcond, label %._crit_edge186.lver.check.preheader, label %._crit_edge185.lver.check

._crit_edge186.lver.check.preheader:              ; preds = %._crit_edge.us
  br label %._crit_edge186.lver.check

.lr.ph160.us:                                     ; preds = %.lr.ph160.us, %._crit_edge156.us
  %38 = phi double [ 1.000000e+00, %._crit_edge156.us ], [ %51, %.lr.ph160.us ]
  %indvars.iv158.us = phi i64 [ 998, %._crit_edge156.us ], [ %indvars.iv.next157.us.1, %.lr.ph160.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 %indvars.iv158.us
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us, i64 %indvars.iv158.us
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv158.us, i64 %indvars.iv163.us
  store double %44, double* %45, align 8
  %indvars.iv.next157.us = add nsw i64 %indvars.iv158.us, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 %indvars.iv.next157.us
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %44
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us, i64 %indvars.iv.next157.us
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next157.us, i64 %indvars.iv163.us
  store double %51, double* %52, align 8
  %53 = icmp sgt i64 %indvars.iv.next157.us, 1
  %indvars.iv.next157.us.1 = add nsw i64 %indvars.iv158.us, -2
  br i1 %53, label %.lr.ph160.us, label %._crit_edge.us

._crit_edge185:                                   ; preds = %._crit_edge185, %._crit_edge185.ph
  %store_forwarded198 = phi double [ %load_initial197, %._crit_edge185.ph ], [ %70, %._crit_edge185 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge185.ph ], [ %58, %._crit_edge185 ]
  %indvars.iv154.us = phi i64 [ 1, %._crit_edge185.ph ], [ %indvars.iv.next.us, %._crit_edge185 ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv163.us, i64 %indvars.iv154.us
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv154.us, i64 %13
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv154.us, i64 %14
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %57 = fadd double %.rhs, 0x40AF420000000001
  %58 = fdiv double 0x409F400000000001, %57
  store double %58, double* %54, align 8
  %59 = bitcast double* %55 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fadd double %62, %63
  %65 = load double, double* %56, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %64, %66
  %68 = fmul double %store_forwarded198, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %57
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv163.us, i64 %indvars.iv154.us
  store double %70, double* %71, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv154.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %._crit_edge156.us.loopexit220, label %._crit_edge185

._crit_edge156.us.loopexit:                       ; preds = %._crit_edge185.lver.orig
  br label %._crit_edge156.us

._crit_edge156.us.loopexit220:                    ; preds = %._crit_edge185
  br label %._crit_edge156.us

._crit_edge156.us:                                ; preds = %._crit_edge156.us.loopexit220, %._crit_edge156.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv163.us
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph160.us

._crit_edge186.lver.check:                        ; preds = %._crit_edge186.lver.check.preheader, %._crit_edge152.us
  %indvar199 = phi i64 [ %73, %._crit_edge152.us ], [ 0, %._crit_edge186.lver.check.preheader ]
  %indvars.iv180.us = phi i64 [ %82, %._crit_edge152.us ], [ 1, %._crit_edge186.lver.check.preheader ]
  %73 = add i64 %indvar199, 1
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %4, i64 %73, i64 0
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %4, i64 %73, i64 999
  %scevgep205 = getelementptr [1000 x double], [1000 x double]* %5, i64 %73, i64 0
  %scevgep207 = getelementptr [1000 x double], [1000 x double]* %5, i64 %73, i64 999
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv180.us
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %74, i64 0, i64 0
  store double 1.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 0
  store double 0.000000e+00, double* %76, align 8
  %77 = bitcast [1000 x double]* %74 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us
  %80 = bitcast [1000 x double]* %79 to i64*
  store i64 %78, i64* %80, align 8
  %81 = add nsw i64 %indvars.iv180.us, -1
  %82 = add nuw nsw i64 %indvars.iv180.us, 1
  %bound0209 = icmp ult double* %scevgep201, %scevgep207
  %bound1210 = icmp ult double* %scevgep205, %scevgep203
  %memcheck.conflict212 = and i1 %bound0209, %bound1210
  br i1 %memcheck.conflict212, label %._crit_edge186.lver.orig.preheader, label %._crit_edge186.ph

._crit_edge186.lver.orig.preheader:               ; preds = %._crit_edge186.lver.check
  br label %._crit_edge186.lver.orig

._crit_edge186.lver.orig:                         ; preds = %._crit_edge186.lver.orig.preheader, %._crit_edge186.lver.orig
  %indvars.iv170.us.lver.orig = phi i64 [ %indvars.iv.next166.us.lver.orig, %._crit_edge186.lver.orig ], [ 1, %._crit_edge186.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv170.us.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 %indvars.iv170.us.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv170.us.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv180.us, i64 %indvars.iv170.us.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv170.us.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us, i64 %83
  %91 = insertelement <2 x double> undef, double %85, i32 0
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = fmul <2 x double> %92, <double 0xC08F400000000001, double 0xC08F400000000001>
  %94 = fadd <2 x double> %93, <double 0x409F440000000001, double 0x409F440000000001>
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fdiv double 0x408F400000000001, %95
  store double %97, double* %86, align 8
  %98 = load double, double* %87, align 8
  %99 = fmul double %98, 0x409F400000000001
  %100 = load double, double* %88, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fadd double %99, %101
  %103 = load double, double* %89, align 8
  %104 = fmul double %103, 0xC09F400000000001
  %105 = fsub double %102, %104
  %106 = load double, double* %90, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fsub double %105, %107
  %109 = fdiv double %108, %96
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us, i64 %indvars.iv170.us.lver.orig
  store double %109, double* %110, align 8
  %indvars.iv.next166.us.lver.orig = add nuw nsw i64 %indvars.iv170.us.lver.orig, 1
  %exitcond168.us.lver.orig = icmp eq i64 %indvars.iv.next166.us.lver.orig, 999
  br i1 %exitcond168.us.lver.orig, label %._crit_edge173.us.loopexit, label %._crit_edge186.lver.orig

._crit_edge186.ph:                                ; preds = %._crit_edge186.lver.check
  %load_initial214 = load double, double* %scevgep201, align 8
  %load_initial217 = load double, double* %scevgep205, align 8
  br label %._crit_edge186

._crit_edge152.us:                                ; preds = %.lr.ph177.us
  %exitcond187 = icmp eq i64 %82, 999
  br i1 %exitcond187, label %._crit_edge152._crit_edge, label %._crit_edge186.lver.check

.lr.ph177.us:                                     ; preds = %.lr.ph177.us, %._crit_edge173.us
  %111 = phi double [ 1.000000e+00, %._crit_edge173.us ], [ %124, %.lr.ph177.us ]
  %indvars.iv175.us = phi i64 [ 998, %._crit_edge173.us ], [ %indvars.iv.next174.us.1, %.lr.ph177.us ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 %indvars.iv175.us
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %111
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us, i64 %indvars.iv175.us
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv180.us, i64 %indvars.iv175.us
  store double %117, double* %118, align 8
  %indvars.iv.next174.us = add nsw i64 %indvars.iv175.us, -1
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 %indvars.iv.next174.us
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us, i64 %indvars.iv.next174.us
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv180.us, i64 %indvars.iv.next174.us
  store double %124, double* %125, align 8
  %126 = icmp sgt i64 %indvars.iv.next174.us, 1
  %indvars.iv.next174.us.1 = add nsw i64 %indvars.iv175.us, -2
  br i1 %126, label %.lr.ph177.us, label %._crit_edge152.us

._crit_edge186:                                   ; preds = %._crit_edge186, %._crit_edge186.ph
  %store_forwarded218 = phi double [ %load_initial217, %._crit_edge186.ph ], [ %148, %._crit_edge186 ]
  %store_forwarded215 = phi double [ %load_initial214, %._crit_edge186.ph ], [ %137, %._crit_edge186 ]
  %indvars.iv170.us = phi i64 [ 1, %._crit_edge186.ph ], [ %indvars.iv.next166.us, %._crit_edge186 ]
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv180.us, i64 %indvars.iv170.us
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv170.us
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv180.us, i64 %indvars.iv170.us
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv170.us
  %131 = insertelement <2 x double> undef, double %store_forwarded215, i32 0
  %132 = shufflevector <2 x double> %131, <2 x double> undef, <2 x i32> zeroinitializer
  %133 = fmul <2 x double> %132, <double 0xC08F400000000001, double 0xC08F400000000001>
  %134 = fadd <2 x double> %133, <double 0x409F440000000001, double 0x409F440000000001>
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fdiv double 0x408F400000000001, %135
  store double %137, double* %127, align 8
  %138 = load double, double* %128, align 8
  %139 = fmul double %138, 0x409F400000000001
  %140 = load double, double* %129, align 8
  %141 = fmul double %140, 0xC0AF3E0000000001
  %142 = fadd double %139, %141
  %143 = load double, double* %130, align 8
  %144 = fmul double %143, 0xC09F400000000001
  %145 = fsub double %142, %144
  %146 = fmul double %store_forwarded218, 0xC08F400000000001
  %147 = fsub double %145, %146
  %148 = fdiv double %147, %136
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv180.us, i64 %indvars.iv170.us
  store double %148, double* %149, align 8
  %indvars.iv.next166.us = add nuw nsw i64 %indvars.iv170.us, 1
  %exitcond168.us = icmp eq i64 %indvars.iv.next166.us, 999
  br i1 %exitcond168.us, label %._crit_edge173.us.loopexit219, label %._crit_edge186

._crit_edge173.us.loopexit:                       ; preds = %._crit_edge186.lver.orig
  br label %._crit_edge173.us

._crit_edge173.us.loopexit219:                    ; preds = %._crit_edge186
  br label %._crit_edge173.us

._crit_edge173.us:                                ; preds = %._crit_edge173.us.loopexit219, %._crit_edge173.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv180.us, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %.lr.ph177.us

._crit_edge152._crit_edge:                        ; preds = %._crit_edge152.us
  %151 = icmp slt i32 %.0183, 500
  %152 = add nuw nsw i32 %.0183, 1
  br i1 %151, label %._crit_edge.preheader, label %._crit_edge184

._crit_edge184:                                   ; preds = %._crit_edge152._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge
  %indvars.iv16.us = phi i64 [ 0, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge ], [ %indvars.iv.next15.us, %._crit_edge._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv16.us, 1000
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.us, %._crit_edge12.us ]
  %7 = add nuw nsw i64 %indvars.iv14.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge12.us

; <label>:11:                                     ; preds = %._crit_edge12.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16.us, i64 %indvars.iv14.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %._crit_edge._crit_edge.us, label %._crit_edge12.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge12.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond18, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
