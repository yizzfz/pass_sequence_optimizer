; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %.lr.ph83

.lr.ph83:                                         ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge66._crit_edge.._crit_edge.preheader_crit_edge
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge66._crit_edge.._crit_edge.preheader_crit_edge ], [ 0, %._crit_edge.preheader.lr.ph ]
  %1 = sub i64 1998, %indvars.iv131
  %2 = shl i64 %1, 3
  br label %._crit_edge

._crit_edge66.preheader:                          ; preds = %._crit_edge
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %3 = icmp slt i64 %indvars.iv.next132, 2000
  br i1 %3, label %._crit_edge66._crit_edge.._crit_edge.preheader_crit_edge, label %._crit_edge67.preheader.us.preheader

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph83
  %indvars.iv117 = phi i64 [ 0, %.lr.ph83 ], [ %indvars.iv.next118, %._crit_edge ]
  %4 = sub nsw i64 0, %indvars.iv117
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv117
  store double %9, double* %10, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond122 = icmp eq i64 %indvars.iv117, %indvars.iv131
  br i1 %exitcond122, label %._crit_edge66.preheader, label %._crit_edge

._crit_edge66._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge66.preheader
  %11 = and i64 %2, 34359738360
  %12 = add nuw nsw i64 %11, 8
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv.next132
  %scevgep129130 = bitcast double* %scevgep129 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep129130, i8 0, i64 %12, i32 8, i1 false)
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %13, align 8
  br label %.lr.ph83

._crit_edge67.preheader.us.preheader:             ; preds = %._crit_edge66.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge67._crit_edge.us.4

._crit_edge71.preheader.us.us.preheader:          ; preds = %._crit_edge71.preheader.us.us.preheader.preheader, %._crit_edge68.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge68.us ], [ 0, %._crit_edge71.preheader.us.us.preheader.preheader ]
  br label %._crit_edge71.preheader.us.us

._crit_edge68.us:                                 ; preds = %._crit_edge69.us.us
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond2, label %._crit_edge72.preheader.us.preheader, label %._crit_edge71.preheader.us.us.preheader

._crit_edge72.preheader.us.preheader:             ; preds = %._crit_edge68.us
  %16 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %._crit_edge72.preheader.us

._crit_edge71.preheader.us.us:                    ; preds = %._crit_edge69.us.us, %._crit_edge71.preheader.us.us.preheader
  %indvars.iv107 = phi i64 [ 0, %._crit_edge71.preheader.us.us.preheader ], [ %indvars.iv.next108, %._crit_edge69.us.us ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv109
  br label %._crit_edge71.us.us

._crit_edge69.us.us:                              ; preds = %._crit_edge71.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond1, label %._crit_edge68.us, label %._crit_edge71.preheader.us.us

._crit_edge71.us.us:                              ; preds = %._crit_edge71.us.us, %._crit_edge71.preheader.us.us
  %indvars.iv103 = phi i64 [ 0, %._crit_edge71.preheader.us.us ], [ %indvars.iv.next104.1, %._crit_edge71.us.us ]
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv109
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv107, i64 %indvars.iv103
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %22, align 8
  %indvars.iv.next104 = or i64 %indvars.iv103, 1
  %25 = load double, double* %17, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next104, i64 %indvars.iv109
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next104
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %29, align 8
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104, 1999
  br i1 %exitcond106.1, label %._crit_edge69.us.us, label %._crit_edge71.us.us

._crit_edge72.preheader.us:                       ; preds = %._crit_edge72.preheader.us.preheader, %._crit_edge70.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge70.us ], [ 0, %._crit_edge72.preheader.us.preheader ]
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us, %._crit_edge72.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge72.preheader.us ], [ %indvars.iv.next.4, %._crit_edge72.us ]
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv101, i64 %indvars.iv
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next.1
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next.2
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next.3
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next.3
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge70.us, label %._crit_edge72.us

._crit_edge70.us:                                 ; preds = %._crit_edge72.us
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond = icmp eq i64 %indvars.iv.next102, 2000
  br i1 %exitcond, label %._crit_edge70._crit_edge, label %._crit_edge72.preheader.us

._crit_edge70._crit_edge:                         ; preds = %._crit_edge70.us
  tail call void @free(i8* nonnull %15) #4
  ret void

._crit_edge67._crit_edge.us.4:                    ; preds = %._crit_edge67._crit_edge.us.4, %._crit_edge67.preheader.us.preheader
  %indvars.iv115 = phi i64 [ 0, %._crit_edge67.preheader.us.preheader ], [ %indvars.iv.next116.4.1, %._crit_edge67._crit_edge.us.4 ]
  %57 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %15, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %57, 16000
  %scevgep.1 = getelementptr i8, i8* %15, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %59 = add nuw nsw i64 %57, 32000
  %scevgep.2 = getelementptr i8, i8* %15, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = add nuw nsw i64 %57, 48000
  %scevgep.3 = getelementptr i8, i8* %15, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %61 = add nuw nsw i64 %57, 64000
  %scevgep.4 = getelementptr i8, i8* %15, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %62 = mul i64 %indvars.iv115, 16000
  %63 = add i64 %62, 80000
  %scevgep.13 = getelementptr i8, i8* %15, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.13, i8 0, i64 16000, i32 8, i1 false)
  %64 = add i64 %62, 96000
  %scevgep.1.1 = getelementptr i8, i8* %15, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = add i64 %62, 112000
  %scevgep.2.1 = getelementptr i8, i8* %15, i64 %65
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %66 = add i64 %62, 128000
  %scevgep.3.1 = getelementptr i8, i8* %15, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = add i64 %62, 144000
  %scevgep.4.1 = getelementptr i8, i8* %15, i64 %67
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.4.1 = add nsw i64 %indvars.iv115, 10
  %68 = icmp slt i64 %indvars.iv.next116.4.1, 2000
  br i1 %68, label %._crit_edge67._crit_edge.us.4, label %._crit_edge71.preheader.us.us.preheader.preheader

._crit_edge71.preheader.us.us.preheader.preheader: ; preds = %._crit_edge67._crit_edge.us.4
  %69 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %._crit_edge71.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.preheader:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge42._crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge42._crit_edge ], [ 0, %._crit_edge.preheader.preheader ]
  %indvars.iv62 = phi i32 [ %indvars.iv.next63, %._crit_edge42._crit_edge ], [ -1, %._crit_edge.preheader.preheader ]
  %1 = add nuw nsw i64 %indvars.iv2, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv2, 0
  br i1 %3, label %._crit_edge41.preheader.preheader, label %._crit_edge42._crit_edge

._crit_edge41.preheader.preheader:                ; preds = %._crit_edge.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 0
  br label %._crit_edge41.preheader

._crit_edge43.preheader.us.preheader:             ; preds = %._crit_edge
  %5 = and i64 %1, 1
  %wide.trip.count64.1 = zext i32 %indvars.iv62 to i64
  %6 = icmp eq i64 %5, 0
  %7 = icmp eq i64 %2, 0
  br label %._crit_edge43.preheader.us

._crit_edge43.preheader.us:                       ; preds = %._crit_edge42.us, %._crit_edge43.preheader.us.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge42.us ], [ %indvars.iv2, %._crit_edge43.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv68
  %.pre54 = load double, double* %8, align 8
  br i1 %6, label %._crit_edge43.us.prol, label %._crit_edge43.us.prol.loopexit

._crit_edge43.us.prol:                            ; preds = %._crit_edge43.preheader.us
  %9 = load double, double* %4, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre54, %12
  store double %13, double* %8, align 8
  br label %._crit_edge43.us.prol.loopexit

._crit_edge43.us.prol.loopexit:                   ; preds = %._crit_edge43.us.prol, %._crit_edge43.preheader.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %._crit_edge43.us.prol ], [ 0, %._crit_edge43.preheader.us ]
  %.unr75.ph = phi double [ %13, %._crit_edge43.us.prol ], [ %.pre54, %._crit_edge43.preheader.us ]
  br i1 %7, label %._crit_edge42.us, label %._crit_edge43.us.preheader

._crit_edge43.us.preheader:                       ; preds = %._crit_edge43.us.prol.loopexit
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.preheader, %._crit_edge43.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %._crit_edge43.us ], [ %indvars.iv60.unr.ph, %._crit_edge43.us.preheader ]
  %14 = phi double [ %26, %._crit_edge43.us ], [ %.unr75.ph, %._crit_edge43.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv60
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv68
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %8, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next61
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next61, i64 %indvars.iv68
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %8, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next61, %wide.trip.count64.1
  br i1 %exitcond65.1, label %._crit_edge42.us.loopexit, label %._crit_edge43.us

._crit_edge42.us.loopexit:                        ; preds = %._crit_edge43.us
  br label %._crit_edge42.us

._crit_edge42.us:                                 ; preds = %._crit_edge42.us.loopexit, %._crit_edge43.us.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond = icmp eq i64 %indvars.iv.next69, 2000
  br i1 %exitcond, label %._crit_edge42._crit_edge.loopexit, label %._crit_edge43.preheader.us

._crit_edge41.preheader:                          ; preds = %._crit_edge, %._crit_edge41.preheader.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge ], [ 0, %._crit_edge41.preheader.preheader ]
  %indvars.iv55 = phi i32 [ %indvars.iv.next56, %._crit_edge ], [ -1, %._crit_edge41.preheader.preheader ]
  %27 = add nuw nsw i64 %indvars.iv57, 4294967295
  %28 = and i64 %27, 4294967295
  %29 = icmp sgt i64 %indvars.iv57, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv57
  %.pre = load double, double* %30, align 8
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge41.preheader
  %31 = and i64 %27, 1
  %lcmp.mod = icmp eq i64 %31, 0
  br i1 %lcmp.mod, label %._crit_edge41.prol, label %._crit_edge41.prol.loopexit

._crit_edge41.prol:                               ; preds = %.lr.ph
  %32 = load double, double* %4, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv57
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre, %35
  store double %36, double* %30, align 8
  br label %._crit_edge41.prol.loopexit

._crit_edge41.prol.loopexit:                      ; preds = %._crit_edge41.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge41.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %36, %._crit_edge41.prol ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %36, %._crit_edge41.prol ], [ undef, %.lr.ph ]
  %37 = icmp eq i64 %28, 0
  br i1 %37, label %._crit_edge, label %._crit_edge41.preheader1

._crit_edge41.preheader1:                         ; preds = %._crit_edge41.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv55 to i64
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.preheader1, %._crit_edge41
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge41 ], [ %indvars.iv.unr.ph, %._crit_edge41.preheader1 ]
  %38 = phi double [ %50, %._crit_edge41 ], [ %.unr.ph, %._crit_edge41.preheader1 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv57
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv57
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge41

._crit_edge.loopexit:                             ; preds = %._crit_edge41
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge41.preheader, %._crit_edge41.prol.loopexit
  %51 = phi double [ %.lcssa.unr.ph, %._crit_edge41.prol.loopexit ], [ %.pre, %._crit_edge41.preheader ], [ %50, %._crit_edge.loopexit ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  %53 = load double, double* %52, align 8
  %54 = fdiv double %51, %53
  store double %54, double* %30, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %indvars.iv.next56 = add nsw i32 %indvars.iv55, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next58, %indvars.iv2
  br i1 %exitcond4, label %._crit_edge43.preheader.us.preheader, label %._crit_edge41.preheader

._crit_edge42._crit_edge.loopexit:                ; preds = %._crit_edge42.us
  br label %._crit_edge42._crit_edge

._crit_edge42._crit_edge:                         ; preds = %._crit_edge42._crit_edge.loopexit, %._crit_edge.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next63 = add nsw i32 %indvars.iv62, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %._crit_edge50, label %._crit_edge.preheader

._crit_edge50:                                    ; preds = %._crit_edge42._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge11.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge11.preheader.us

._crit_edge11.preheader.us:                       ; preds = %._crit_edge11._crit_edge.us, %._crit_edge11.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge11.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge11._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %._crit_edge11.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge11.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge11._crit_edge.us, label %6

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge14, label %._crit_edge11.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge11._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
