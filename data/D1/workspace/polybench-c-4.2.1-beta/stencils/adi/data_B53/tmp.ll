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
.preheader.lr.ph..preheader_crit_edge:
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph..preheader_crit_edge
  %indvars.iv26 = phi i64 [ 0, %.preheader.lr.ph..preheader_crit_edge ], [ %indvars.iv.next3, %._crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv26, 1000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge9 ]
  %3 = sub nuw nsw i64 %2, %indvars.iv5
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
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
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge9

._crit_edge:                                      ; preds = %._crit_edge9
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader16.lr.ph:
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge40, %.preheader16.lr.ph
  %.0341 = phi i32 [ 1, %.preheader16.lr.ph ], [ %153, %._crit_edge40 ]
  br label %._crit_edge43.lver.check

._crit_edge43.lver.check:                         ; preds = %._crit_edge22, %.preheader16
  %indvar = phi i64 [ 0, %.preheader16 ], [ %indvar.next, %._crit_edge22 ]
  %indvars.iv623 = phi i64 [ 1, %.preheader16 ], [ %15, %._crit_edge22 ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv623
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv623, -1
  %15 = add nuw nsw i64 %indvars.iv623, 1
  %bound0 = icmp ult double* %scevgep, %scevgep52
  %bound1 = icmp ult double* %scevgep50, %scevgep48
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge43.lver.orig.preheader, label %._crit_edge43.ph

._crit_edge43.lver.orig.preheader:                ; preds = %._crit_edge43.lver.check
  br label %._crit_edge43.lver.orig

._crit_edge43.lver.orig:                          ; preds = %._crit_edge43.lver.orig.preheader, %._crit_edge43.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge43.lver.orig ], [ 1, %._crit_edge43.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv18.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %14
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %15
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %16
  %.rhs.lver.orig = fmul double %18, 0xC09F400000000001
  %23 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %24 = fdiv double 0x409F400000000001, %23
  store double %24, double* %19, align 8
  %25 = bitcast double* %20 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %29, %28
  %31 = load double, double* %21, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %30, %32
  %34 = load double, double* %22, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %33, %35
  %37 = fdiv double %36, %23
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %._crit_edge43.lver.orig

._crit_edge43.ph:                                 ; preds = %._crit_edge43.lver.check
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep54 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep54, align 8
  %load_initial56 = load double, double* %scevgep55, align 8
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43, %._crit_edge43.ph
  %store_forwarded57 = phi double [ %load_initial56, %._crit_edge43.ph ], [ %55, %._crit_edge43 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge43.ph ], [ %43, %._crit_edge43 ]
  %indvars.iv18 = phi i64 [ 1, %._crit_edge43.ph ], [ %indvars.iv.next, %._crit_edge43 ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv18
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %14
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %15
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %42 = fadd double %.rhs, 0x40AF420000000001
  %43 = fdiv double 0x409F400000000001, %42
  store double %43, double* %39, align 8
  %44 = bitcast double* %40 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %47 = extractelement <2 x double> %46, i32 0
  %48 = extractelement <2 x double> %46, i32 1
  %49 = fsub double %48, %47
  %50 = load double, double* %41, align 8
  %51 = fmul double %50, 0xC08F400000000001
  %52 = fsub double %49, %51
  %53 = fmul double %store_forwarded57, 0xC09F400000000001
  %54 = fsub double %52, %53
  %55 = fdiv double %54, %42
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv18
  store double %55, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.loopexit79, label %._crit_edge43

._crit_edge.loopexit:                             ; preds = %._crit_edge43.lver.orig
  br label %._crit_edge

._crit_edge.loopexit79:                           ; preds = %._crit_edge43
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit79, %._crit_edge.loopexit
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv623
  store double 1.000000e+00, double* %57, align 8
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21, %._crit_edge
  %58 = phi double [ 1.000000e+00, %._crit_edge ], [ %71, %.lr.ph21 ]
  %indvars.iv419 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next5.1, %.lr.ph21 ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv419
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %58
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv419
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv419, i64 %indvars.iv623
  store double %64, double* %65, align 8
  %indvars.iv.next5 = add nsw i64 %indvars.iv419, -1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv.next5
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %64
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv.next5
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next5, i64 %indvars.iv623
  store double %71, double* %72, align 8
  %73 = icmp sgt i64 %indvars.iv.next5, 1
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv419, -2
  br i1 %73, label %.lr.ph21, label %._crit_edge22

._crit_edge22:                                    ; preds = %.lr.ph21
  %exitcond45 = icmp eq i64 %15, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond45, label %._crit_edge44.lver.check.preheader, label %._crit_edge43.lver.check

._crit_edge44.lver.check.preheader:               ; preds = %._crit_edge22
  br label %._crit_edge44.lver.check

._crit_edge44.lver.check:                         ; preds = %._crit_edge44.lver.check.preheader, %._crit_edge35
  %indvar58 = phi i64 [ %indvar.next59, %._crit_edge35 ], [ 0, %._crit_edge44.lver.check.preheader ]
  %indvars.iv1436 = phi i64 [ %83, %._crit_edge35 ], [ 1, %._crit_edge44.lver.check.preheader ]
  %74 = add i64 %indvar58, 1
  %75 = add i64 %indvar58, 1
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 999
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 0
  %scevgep66 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast double* %76 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv1436, -1
  %83 = add nuw nsw i64 %indvars.iv1436, 1
  %bound068 = icmp ult double* %scevgep60, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep62
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %._crit_edge44.lver.orig.preheader, label %._crit_edge44.ph

._crit_edge44.lver.orig.preheader:                ; preds = %._crit_edge44.lver.check
  br label %._crit_edge44.lver.orig

._crit_edge44.lver.orig:                          ; preds = %._crit_edge44.lver.orig.preheader, %._crit_edge44.lver.orig
  %indvars.iv828.lver.orig = phi i64 [ %indvars.iv.next9.lver.orig, %._crit_edge44.lver.orig ], [ 1, %._crit_edge44.lver.orig.preheader ]
  %84 = add nsw i64 %indvars.iv828.lver.orig, -1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %84
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv828.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %83, i64 %indvars.iv828.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %84
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
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  store double %110, double* %111, align 8
  %indvars.iv.next9.lver.orig = add nuw nsw i64 %indvars.iv828.lver.orig, 1
  %exitcond11.lver.orig = icmp eq i64 %indvars.iv.next9.lver.orig, 999
  br i1 %exitcond11.lver.orig, label %._crit_edge31.loopexit, label %._crit_edge44.lver.orig

._crit_edge44.ph:                                 ; preds = %._crit_edge44.lver.check
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 0
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 0
  %load_initial73 = load double, double* %scevgep72, align 8
  %load_initial76 = load double, double* %scevgep75, align 8
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge44.ph
  %store_forwarded77 = phi double [ %load_initial76, %._crit_edge44.ph ], [ %133, %._crit_edge44 ]
  %store_forwarded74 = phi double [ %load_initial73, %._crit_edge44.ph ], [ %122, %._crit_edge44 ]
  %indvars.iv828 = phi i64 [ 1, %._crit_edge44.ph ], [ %indvars.iv.next9, %._crit_edge44 ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv828
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv828
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %83, i64 %indvars.iv828
  %116 = insertelement <2 x double> undef, double %store_forwarded74, i32 0
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
  %131 = fmul double %store_forwarded77, 0xC08F400000000001
  %132 = fsub double %130, %131
  %133 = fdiv double %132, %121
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv828
  store double %133, double* %134, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv828, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 999
  br i1 %exitcond11, label %._crit_edge31.loopexit78, label %._crit_edge44

._crit_edge31.loopexit:                           ; preds = %._crit_edge44.lver.orig
  br label %._crit_edge31

._crit_edge31.loopexit78:                         ; preds = %._crit_edge44
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit78, %._crit_edge31.loopexit
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 999
  store double 1.000000e+00, double* %135, align 8
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34, %._crit_edge31
  %136 = phi double [ 1.000000e+00, %._crit_edge31 ], [ %149, %.lr.ph34 ]
  %indvars.iv1232 = phi i64 [ 998, %._crit_edge31 ], [ %indvars.iv.next13.1, %.lr.ph34 ]
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv1232
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, %136
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv1232
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv1232
  store double %142, double* %143, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv1232, -1
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv.next13
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %142
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv.next13
  %148 = load double, double* %147, align 8
  %149 = fadd double %146, %148
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv.next13
  store double %149, double* %150, align 8
  %151 = icmp sgt i64 %indvars.iv.next13, 1
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1232, -2
  br i1 %151, label %.lr.ph34, label %._crit_edge35

._crit_edge35:                                    ; preds = %.lr.ph34
  %exitcond46 = icmp eq i64 %83, 999
  %indvar.next59 = add i64 %indvar58, 1
  br i1 %exitcond46, label %._crit_edge40, label %._crit_edge44.lver.check

._crit_edge40:                                    ; preds = %._crit_edge35
  %152 = icmp slt i32 %.0341, 500
  %153 = add nuw nsw i32 %.0341, 1
  br i1 %152, label %.preheader16, label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge40
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph..preheader_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph..preheader_crit_edge
  %indvars.iv26 = phi i64 [ 0, %.preheader.lr.ph..preheader_crit_edge ], [ %indvars.iv.next3, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge9 ]
  %7 = add nuw nsw i64 %indvars.iv5, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge9

; <label>:11:                                     ; preds = %._crit_edge10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge10, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge, label %._crit_edge10

._crit_edge:                                      ; preds = %._crit_edge9
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond11, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
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
