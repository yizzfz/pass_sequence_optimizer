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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.preheader.preheader:
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %1 = add nuw nsw i64 %indvars.iv26, 1000
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader, %.preheader.new
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ 0, %.preheader ]
  %2 = sub i64 %1, %indvars.iv5
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %6 = sub i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge, label %.preheader.new

._crit_edge:                                      ; preds = %.preheader.new
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader16.lr.ph:
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge40, %.preheader16.lr.ph
  %.0341 = phi i32 [ 1, %.preheader16.lr.ph ], [ %146, %._crit_edge40 ]
  br label %.lver.check

.lver.check:                                      ; preds = %.preheader16, %._crit_edge22
  %indvar = phi i64 [ 0, %.preheader16 ], [ %indvar.next, %._crit_edge22 ]
  %indvars.iv623 = phi i64 [ 1, %.preheader16 ], [ %13, %._crit_edge22 ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv623
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv623, -1
  %13 = add nuw nsw i64 %indvars.iv623, 1
  %bound0 = icmp ult double* %scevgep, %scevgep57
  %bound1 = icmp ult double* %scevgep55, %scevgep53
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv18.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, 0xC09F400000000001
  %18 = fadd double %17, 0x40AF420000000001
  %19 = fdiv double 0x409F400000000001, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %12
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.lver.orig, i64 %13
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %27, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623, i64 %14
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %31, %34
  %36 = fdiv double %35, %18
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep59, align 8
  %load_initial61 = load double, double* %scevgep60, align 8
  br label %38

; <label>:38:                                     ; preds = %.ph, %38
  %store_forwarded62 = phi double [ %load_initial61, %.ph ], [ %56, %38 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %41, %38 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %38 ]
  %39 = fmul double %store_forwarded, 0xC09F400000000001
  %40 = fadd double %39, 0x40AF420000000001
  %41 = fdiv double 0x409F400000000001, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 %indvars.iv18
  store double %41, double* %42, align 8
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %12
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %47 = extractelement <2 x double> %46, i32 0
  %48 = extractelement <2 x double> %46, i32 1
  %49 = fsub double %48, %47
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18, i64 %13
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 0xC08F400000000001
  %53 = fsub double %49, %52
  %54 = fmul double %store_forwarded62, 0xC09F400000000001
  %55 = fsub double %53, %54
  %56 = fdiv double %55, %40
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623, i64 %indvars.iv18
  store double %56, double* %57, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.loopexit86, label %38

._crit_edge.loopexit:                             ; preds = %.ph.lver.orig
  br label %._crit_edge

._crit_edge.loopexit86:                           ; preds = %38
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit86, %._crit_edge.loopexit
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv623
  store double 1.000000e+00, double* %58, align 8
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21, %._crit_edge
  %59 = phi double [ 1.000000e+00, %._crit_edge ], [ %72, %.lr.ph21 ]
  %indvars.iv419 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next5.1, %.lr.ph21 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 %indvars.iv419
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %59
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623, i64 %indvars.iv419
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv419, i64 %indvars.iv623
  store double %65, double* %66, align 8
  %indvars.iv.next5 = add nsw i64 %indvars.iv419, -1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv623, i64 %indvars.iv.next5
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %65
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv623, i64 %indvars.iv.next5
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next5, i64 %indvars.iv623
  store double %72, double* %73, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv419, -2
  %74 = icmp sgt i64 %indvars.iv.next5, 1
  br i1 %74, label %.lr.ph21, label %._crit_edge22

._crit_edge22:                                    ; preds = %.lr.ph21
  %exitcond47 = icmp eq i64 %13, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond47, label %.lver.check77.preheader, label %.lver.check

.lver.check77.preheader:                          ; preds = %._crit_edge22
  br label %.lver.check77

.lver.check77:                                    ; preds = %.lver.check77.preheader, %._crit_edge35
  %indvar63 = phi i64 [ %indvar.next64, %._crit_edge35 ], [ 0, %.lver.check77.preheader ]
  %indvars.iv1436 = phi i64 [ %84, %._crit_edge35 ], [ 1, %.lver.check77.preheader ]
  %75 = add i64 %indvar63, 1
  %76 = add i64 %indvar63, 1
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %2, i64 %76, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %2, i64 %76, i64 999
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %3, i64 %76, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %3, i64 %76, i64 999
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1436, i64 0
  store double 1.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 0
  store double 0.000000e+00, double* %78, align 8
  %79 = bitcast double* %77 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436
  %82 = bitcast [1000 x double]* %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = add nsw i64 %indvars.iv1436, -1
  %84 = add nuw nsw i64 %indvars.iv1436, 1
  %bound073 = icmp ult double* %scevgep65, %scevgep71
  %bound174 = icmp ult double* %scevgep69, %scevgep67
  %memcheck.conflict76 = and i1 %bound073, %bound174
  br i1 %memcheck.conflict76, label %.ph78.lver.orig.preheader, label %.ph78

.ph78.lver.orig.preheader:                        ; preds = %.lver.check77
  br label %.ph78.lver.orig

.ph78.lver.orig:                                  ; preds = %.ph78.lver.orig.preheader, %.ph78.lver.orig
  %indvars.iv828.lver.orig = phi i64 [ %indvars.iv.next9.lver.orig, %.ph78.lver.orig ], [ 1, %.ph78.lver.orig.preheader ]
  %85 = add nsw i64 %indvars.iv828.lver.orig, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, 0xC08F400000000001
  %89 = fadd double %88, 0x409F440000000001
  %90 = fdiv double 0x408F400000000001, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  store double %90, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv828.lver.orig
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC09F400000000001
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC0AF3E0000000001
  %98 = fsub double %97, %94
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv828.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %98, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %85
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %102, %105
  %107 = fdiv double %106, %89
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  store double %107, double* %108, align 8
  %indvars.iv.next9.lver.orig = add nuw nsw i64 %indvars.iv828.lver.orig, 1
  %exitcond11.lver.orig = icmp eq i64 %indvars.iv.next9.lver.orig, 999
  br i1 %exitcond11.lver.orig, label %._crit_edge31.loopexit, label %.ph78.lver.orig

.ph78:                                            ; preds = %.lver.check77
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %load_initial80 = load double, double* %scevgep79, align 8
  %load_initial83 = load double, double* %scevgep82, align 8
  br label %109

; <label>:109:                                    ; preds = %.ph78, %109
  %store_forwarded84 = phi double [ %load_initial83, %.ph78 ], [ %127, %109 ]
  %store_forwarded81 = phi double [ %load_initial80, %.ph78 ], [ %112, %109 ]
  %indvars.iv828 = phi i64 [ 1, %.ph78 ], [ %indvars.iv.next9, %109 ]
  %110 = fmul double %store_forwarded81, 0xC08F400000000001
  %111 = fadd double %110, 0x409F440000000001
  %112 = fdiv double 0x408F400000000001, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv828
  store double %112, double* %113, align 8
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv828
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, 0xC09F400000000001
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1436, i64 %indvars.iv828
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 0xC0AF3E0000000001
  %120 = fsub double %119, %116
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %84, i64 %indvars.iv828
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 0xC09F400000000001
  %124 = fsub double %120, %123
  %125 = fmul double %store_forwarded84, 0xC08F400000000001
  %126 = fsub double %124, %125
  %127 = fdiv double %126, %111
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828
  store double %127, double* %128, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv828, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 999
  br i1 %exitcond11, label %._crit_edge31.loopexit85, label %109

._crit_edge31.loopexit:                           ; preds = %.ph78.lver.orig
  br label %._crit_edge31

._crit_edge31.loopexit85:                         ; preds = %109
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit85, %._crit_edge31.loopexit
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1436, i64 999
  store double 1.000000e+00, double* %129, align 8
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34, %._crit_edge31
  %130 = phi double [ 1.000000e+00, %._crit_edge31 ], [ %143, %.lr.ph34 ]
  %indvars.iv1232 = phi i64 [ 998, %._crit_edge31 ], [ %indvars.iv.next13.1, %.lr.ph34 ]
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv1232
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %130
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv1232
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1436, i64 %indvars.iv1232
  store double %136, double* %137, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv1232, -1
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv.next13
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %136
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv.next13
  %142 = load double, double* %141, align 8
  %143 = fadd double %140, %142
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1436, i64 %indvars.iv.next13
  store double %143, double* %144, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1232, -2
  %145 = icmp sgt i64 %indvars.iv.next13, 1
  br i1 %145, label %.lr.ph34, label %._crit_edge35

._crit_edge35:                                    ; preds = %.lr.ph34
  %exitcond49 = icmp eq i64 %84, 999
  %indvar.next64 = add i64 %indvar63, 1
  br i1 %exitcond49, label %._crit_edge40, label %.lver.check77

._crit_edge40:                                    ; preds = %._crit_edge35
  %146 = add nuw nsw i32 %.0341, 1
  %exitcond51 = icmp eq i32 %.0341, 500
  br i1 %exitcond51, label %._crit_edge42, label %.preheader16

._crit_edge42:                                    ; preds = %._crit_edge40
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %5 = mul nsw i64 %indvars.iv26, 1000
  br label %6

; <label>:6:                                      ; preds = %.preheader, %13
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %13 ]
  %7 = add nsw i64 %indvars.iv5, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv5
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %13
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
