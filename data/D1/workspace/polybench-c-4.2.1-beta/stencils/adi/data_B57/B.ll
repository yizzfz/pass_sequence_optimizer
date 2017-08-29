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
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next7, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv6, 1000
  %2 = trunc i64 %1 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = sub nsw i64 0, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = add nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %8 = trunc i64 %indvars.iv to i32
  %9 = xor i32 %8, -1
  %10 = add nsw i32 %2, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.lr.ph11.split.us.preheader

.lr.ph11.split.us.preheader:                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %142, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %4, %._crit_edge9.us ]
  %indvars.iv27 = phi i64 [ 1, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next28, %._crit_edge9.us ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep3 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %12
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, 0xC09F400000000001
  %16 = fadd double %15, 0x40AF420000000001
  %17 = fdiv double 0x409F400000000001, %16
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %20 = bitcast double* %19 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %22 = fmul <2 x double> %21, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = fsub double %24, %23
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %25, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %12
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %29, %32
  %34 = fdiv double %33, %16
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond42.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond42.lver.orig, label %.lr.ph8.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial11 = load double, double* %scevgep5, align 8
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %.ph
  %store_forwarded12 = phi double [ %load_initial11, %.ph ], [ %53, %._crit_edge36 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %38, %._crit_edge36 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge36 ]
  %36 = fmul double %store_forwarded, 0xC09F400000000001
  %37 = fadd double %36, 0x40AF420000000001
  %38 = fdiv double 0x409F400000000001, %37
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  store double %38, double* %39, align 8
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %41 = bitcast double* %40 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %46 = fsub double %45, %44
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next28
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 0xC08F400000000001
  %50 = fsub double %46, %49
  %51 = fmul double %store_forwarded12, 0xC09F400000000001
  %52 = fsub double %50, %51
  %53 = fdiv double %52, %37
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond42, label %.lr.ph8.us.preheader.loopexit43, label %._crit_edge36

.lr.ph8.us.preheader.loopexit:                    ; preds = %.ph.lver.orig
  br label %.lr.ph8.us.preheader

.lr.ph8.us.preheader.loopexit43:                  ; preds = %._crit_edge36
  br label %.lr.ph8.us.preheader

.lr.ph8.us.preheader:                             ; preds = %.lr.ph8.us.preheader.loopexit43, %.lr.ph8.us.preheader.loopexit
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %55, align 8
  br label %.lr.ph8.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %.lr.ph8.us.preheader
  %indvars.iv25 = phi i64 [ 998, %.lr.ph8.us.preheader ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %56 = phi double [ 1.000000e+00, %.lr.ph8.us.preheader ], [ %69, %.lr.ph8.us ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv25
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv25
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv27
  store double %62, double* %63, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.next26
  %65 = load double, double* %64, align 8
  %66 = fmul double %62, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.next26
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %69, double* %70, align 8
  %71 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %71, label %.lr.ph8.us, label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  br i1 %exitcond30, label %.lver.check27.preheader, label %.lver.check

.lver.check27.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check27

.lver.check27:                                    ; preds = %.lver.check27.preheader, %._crit_edge19.us
  %indvar13 = phi i64 [ %72, %._crit_edge19.us ], [ 0, %.lver.check27.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %.lver.check27.preheader ]
  %72 = add nuw nsw i64 %indvar13, 1
  %scevgep15 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 0
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 999
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 0
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 999
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 0
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast double* %73 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound023 = icmp ult double* %scevgep15, %scevgep21
  %bound124 = icmp ult double* %scevgep19, %scevgep17
  %memcheck.conflict26 = and i1 %bound023, %bound124
  br i1 %memcheck.conflict26, label %.ph28.lver.orig.preheader, label %.ph28

.ph28.lver.orig.preheader:                        ; preds = %.lver.check27
  br label %.ph28.lver.orig

.ph28.lver.orig:                                  ; preds = %.ph28.lver.orig.preheader, %.ph28.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph28.lver.orig ], [ 1, %.ph28.lver.orig.preheader ]
  %80 = add nsw i64 %indvars.iv31.lver.orig, -1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %80
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, 0xC08F400000000001
  %84 = fadd double %83, 0x409F440000000001
  %85 = fdiv double 0x408F400000000001, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv31.lver.orig
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, 0xC09F400000000001
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC0AF3E0000000001
  %93 = fsub double %92, %89
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = fsub double %93, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %80
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC08F400000000001
  %101 = fsub double %97, %100
  %102 = fdiv double %101, %84
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %102, double* %103, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.lr.ph18.us.preheader.loopexit, label %.ph28.lver.orig

.ph28:                                            ; preds = %.lver.check27
  %load_initial30 = load double, double* %scevgep15, align 8
  %load_initial33 = load double, double* %scevgep19, align 8
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39, %.ph28
  %store_forwarded34 = phi double [ %load_initial33, %.ph28 ], [ %121, %._crit_edge39 ]
  %store_forwarded31 = phi double [ %load_initial30, %.ph28 ], [ %106, %._crit_edge39 ]
  %indvars.iv31 = phi i64 [ 1, %.ph28 ], [ %indvars.iv.next32, %._crit_edge39 ]
  %104 = fmul double %store_forwarded31, 0xC08F400000000001
  %105 = fadd double %104, 0x409F440000000001
  %106 = fdiv double 0x408F400000000001, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31
  store double %106, double* %107, align 8
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv31
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 0xC09F400000000001
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 0xC0AF3E0000000001
  %114 = fsub double %113, %110
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 0xC09F400000000001
  %118 = fsub double %114, %117
  %119 = fmul double %store_forwarded34, 0xC08F400000000001
  %120 = fsub double %118, %119
  %121 = fdiv double %120, %105
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  store double %121, double* %122, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond, label %.lr.ph18.us.preheader.loopexit42, label %._crit_edge39

.lr.ph18.us.preheader.loopexit:                   ; preds = %.ph28.lver.orig
  br label %.lr.ph18.us.preheader

.lr.ph18.us.preheader.loopexit42:                 ; preds = %._crit_edge39
  br label %.lr.ph18.us.preheader

.lr.ph18.us.preheader:                            ; preds = %.lr.ph18.us.preheader.loopexit42, %.lr.ph18.us.preheader.loopexit
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %123, align 8
  br label %.lr.ph18.us

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %.lr.ph18.us.preheader
  %indvars.iv35 = phi i64 [ 998, %.lr.ph18.us.preheader ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  %125 = load double, double* %124, align 8
  %126 = or i64 %indvars.iv35, 1
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %126
  %128 = load double, double* %127, align 8
  %129 = fmul double %125, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv35
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv35
  store double %132, double* %133, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %132
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next36
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %139, double* %140, align 8
  %141 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %141, label %.lr.ph18.us, label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 999
  br i1 %exitcond40, label %._crit_edge22, label %.lver.check27

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %exitcond41 = icmp eq i32 %.0323, 500
  %142 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond41, label %._crit_edge24, label %.lr.ph11.split.us.preheader

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond9, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
