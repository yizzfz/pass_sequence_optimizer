; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %9 = zext i32 %1 to i64
  %10 = add nsw i64 %9, -1
  %wide.trip.count47 = zext i32 %0 to i64
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader27.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %11 ], [ 0, %.preheader27.us ]
  %12 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %20, align 8
  %exitcond = icmp eq i64 %indvars.iv41, %10
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  br i1 %exitcond, label %._crit_edge33.us, label %11

._crit_edge33.us:                                 ; preds = %11
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol, %._crit_edge.us.prol.preheader
  %indvars.iv37.prol = phi i64 [ 0, %._crit_edge.us.prol.preheader ], [ %indvars.iv.next38.prol, %._crit_edge.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge.us.prol.preheader ], [ %prol.iter.sub, %._crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep52.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next38.prol, %._crit_edge.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 7
  br i1 %25, label %._crit_edge30, label %.preheader.us.preheader.new

.preheader.us.preheader.new:                      ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.preheader.us.preheader.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr, %.preheader.us.preheader.new ], [ %indvars.iv.next38.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep52 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep52.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep52.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep52.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep52.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.4, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.4, i64 0
  %scevgep52.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.5, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.5, i64 0
  %scevgep52.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.6, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.6, i64 0
  %scevgep52.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep52.7, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %exitcond40.7 = icmp eq i64 %indvars.iv.next38.7, %22
  br i1 %exitcond40.7, label %._crit_edge30.loopexit, label %._crit_edge.us

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %._crit_edge.us.prol.loopexit, %.preheader27.lr.ph, %.preheader26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader76.lr.ph, label %._crit_edge93

.preheader76.lr.ph:                               ; preds = %5
  %7 = sext i32 %1 to i64
  %8 = zext i32 %0 to i64
  %9 = add nsw i64 %8, -1
  %10 = zext i32 %1 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add nsw i64 %11, -8
  %xtraiter = and i64 %8, 3
  %xtraiter151 = and i64 %8, 1
  %xtraiter155 = and i64 %8, 1
  %xtraiter157 = and i64 %9, 1
  br label %.preheader76

.loopexit.loopexit108:                            ; preds = %.lr.ph91
  %13 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 %18, i32 8, i1 false)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge88.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge82, %.loopexit.loopexit108
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %10
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  br i1 %exitcond136, label %._crit_edge93.loopexit, label %.preheader76

.preheader76:                                     ; preds = %.loopexit, %.preheader76.lr.ph
  %indvars.iv133 = phi i64 [ 0, %.preheader76.lr.ph ], [ %indvars.iv.next134, %.loopexit ]
  %indvars.iv127 = phi i64 [ 1, %.preheader76.lr.ph ], [ %indvars.iv.next128, %.loopexit ]
  %14 = icmp sgt i32 %0, 0
  %15 = mul i64 %indvars.iv133, 1201
  %16 = add i64 %15, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %16
  %17 = mul i64 %indvars.iv133, -8
  %18 = add i64 %12, %17
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader76
  %19 = icmp eq i64 %xtraiter, 0
  br i1 %19, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %.078.prol = phi double [ %23, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv133
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fadd double %.078.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.078.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.loopexit ]
  %24 = icmp ult i64 %9, 3
  br i1 %24, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next.3, %.lr.ph ]
  %.078 = phi double [ %.078.unr, %.lr.ph.preheader.new ], [ %40, %.lr.ph ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv133
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %26
  %28 = fadd double %.078, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv133
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %30
  %32 = fadd double %28, %31
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv133
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %34
  %36 = fadd double %32, %35
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv133
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fadd double %36, %39
  %exitcond141.3 = icmp eq i64 %indvars.iv.next.2, %9
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond141.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader76
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader76 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %40, %._crit_edge.loopexit ]
  %41 = icmp sgt i32 %0, 0
  %42 = tail call double @sqrt(double %.0.lcssa) #4
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv133
  store double %42, double* %44, align 8
  br i1 %41, label %.lr.ph81, label %._crit_edge82

.lr.ph81:                                         ; preds = %._crit_edge
  %45 = icmp eq i64 %xtraiter151, 0
  br i1 %45, label %.prol.loopexit, label %46

; <label>:46:                                     ; preds = %.lr.ph81
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv133
  %48 = load double, double* %47, align 8
  %sunkaddr162 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr163 = mul i64 %indvars.iv133, 8
  %sunkaddr164 = add i64 %sunkaddr162, %sunkaddr163
  %sunkaddr165 = inttoptr i64 %sunkaddr164 to double*
  %49 = load double, double* %sunkaddr165, align 8
  %50 = fdiv double %48, %49
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv133
  store double %50, double* %51, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %46, %.lr.ph81
  %indvars.iv109.unr.ph = phi i64 [ 1, %46 ], [ 0, %.lr.ph81 ]
  %52 = icmp eq i64 %9, 0
  br i1 %52, label %._crit_edge82, label %.lr.ph81.new

.lr.ph81.new:                                     ; preds = %.prol.loopexit
  br label %53

; <label>:53:                                     ; preds = %53, %.lr.ph81.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr.ph, %.lr.ph81.new ], [ %indvars.iv.next110.1, %53 ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv109, i64 %indvars.iv133
  %55 = load double, double* %54, align 8
  %sunkaddr166 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr167 = mul i64 %indvars.iv133, 8
  %sunkaddr168 = add i64 %sunkaddr166, %sunkaddr167
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to double*
  %56 = load double, double* %sunkaddr169, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv133
  store double %57, double* %58, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next110, i64 %indvars.iv133
  %60 = load double, double* %59, align 8
  %61 = load double, double* %sunkaddr169, align 8
  %62 = fdiv double %60, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next110, i64 %indvars.iv133
  store double %62, double* %63, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next110, %9
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  br i1 %exitcond.1, label %._crit_edge82.loopexit, label %53

._crit_edge82.loopexit:                           ; preds = %53
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %.prol.loopexit, %._crit_edge
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %64 = icmp slt i64 %indvars.iv.next134, %7
  br i1 %64, label %.lr.ph91, label %.loopexit

.lr.ph91:                                         ; preds = %._crit_edge82
  %65 = icmp sgt i32 %0, 0
  br i1 %65, label %.lr.ph91.split.us.preheader, label %.loopexit.loopexit108

.lr.ph91.split.us.preheader:                      ; preds = %.lr.ph91
  br label %.lr.ph91.split.us

.lr.ph91.split.us:                                ; preds = %.lr.ph91.split.us.preheader, %._crit_edge88.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge88.us ], [ %indvars.iv127, %.lr.ph91.split.us.preheader ]
  %66 = icmp eq i64 %xtraiter155, 0
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv129
  store double 0.000000e+00, double* %67, align 8
  br i1 %66, label %.prol.loopexit154, label %68

; <label>:68:                                     ; preds = %.lr.ph91.split.us
  %sunkaddr = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr170 = mul i64 %indvars.iv133, 8
  %sunkaddr171 = add i64 %sunkaddr, %sunkaddr170
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  %69 = load double, double* %sunkaddr172, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv129
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, 0.000000e+00
  %sunkaddr173 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr174 = mul i64 %indvars.iv129, 8
  %sunkaddr175 = add i64 %sunkaddr173, %sunkaddr174
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to double*
  store double %73, double* %sunkaddr176, align 8
  br label %.prol.loopexit154

.prol.loopexit154:                                ; preds = %68, %.lr.ph91.split.us
  %.lcssa150.unr.ph = phi double [ %73, %68 ], [ undef, %.lr.ph91.split.us ]
  %indvars.iv119.unr.ph = phi i64 [ 1, %68 ], [ 0, %.lr.ph91.split.us ]
  %.unr.ph = phi double [ %73, %68 ], [ 0.000000e+00, %.lr.ph91.split.us ]
  %74 = icmp eq i64 %9, 0
  br i1 %74, label %.lr.ph87.us, label %.lr.ph91.split.us.new

.lr.ph91.split.us.new:                            ; preds = %.prol.loopexit154
  br label %75

; <label>:75:                                     ; preds = %75, %.lr.ph91.split.us.new
  %indvars.iv119 = phi i64 [ %indvars.iv119.unr.ph, %.lr.ph91.split.us.new ], [ %indvars.iv.next120.1, %75 ]
  %76 = phi double [ %.unr.ph, %.lr.ph91.split.us.new ], [ %88, %75 ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv119, i64 %indvars.iv133
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 %indvars.iv129
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  %sunkaddr177 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr178 = mul i64 %indvars.iv129, 8
  %sunkaddr179 = add i64 %sunkaddr177, %sunkaddr178
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to double*
  store double %82, double* %sunkaddr180, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next120, i64 %indvars.iv133
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next120, i64 %indvars.iv129
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %sunkaddr180, align 8
  %exitcond144.1 = icmp eq i64 %indvars.iv.next120, %9
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  br i1 %exitcond144.1, label %.lr.ph87.us.loopexit, label %75

.lr.ph87.us.loopexit:                             ; preds = %75
  br label %.lr.ph87.us

.lr.ph87.us:                                      ; preds = %.lr.ph87.us.loopexit, %.prol.loopexit154
  %.lcssa150 = phi double [ %.lcssa150.unr.ph, %.prol.loopexit154 ], [ %88, %.lr.ph87.us.loopexit ]
  %89 = icmp eq i64 %9, 0
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv129
  %91 = load double, double* %90, align 8
  %sunkaddr181 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr182 = mul i64 %indvars.iv133, 8
  %sunkaddr183 = add i64 %sunkaddr181, %sunkaddr182
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  %92 = load double, double* %sunkaddr184, align 8
  %93 = fmul double %92, %.lcssa150
  %94 = fsub double %91, %93
  store double %94, double* %90, align 8
  br i1 %89, label %._crit_edge88.us, label %._crit_edge140.preheader

._crit_edge140.preheader:                         ; preds = %.lr.ph87.us
  %95 = icmp eq i64 %xtraiter157, 0
  br i1 %95, label %._crit_edge140.prol.loopexit, label %._crit_edge140.prol

._crit_edge140.prol:                              ; preds = %._crit_edge140.preheader
  %sunkaddr185 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr186 = mul i64 %indvars.iv129, 8
  %sunkaddr187 = add i64 %sunkaddr185, %sunkaddr186
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to double*
  %.pre.prol = load double, double* %sunkaddr188, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1, i64 %indvars.iv129
  %97 = load double, double* %96, align 8
  %sunkaddr189 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr190 = mul i64 %indvars.iv133, 8
  %sunkaddr191 = add i64 %sunkaddr189, %sunkaddr190
  %sunkaddr192 = add i64 %sunkaddr191, 9600
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to double*
  %98 = load double, double* %sunkaddr193, align 8
  %99 = fmul double %98, %.pre.prol
  %100 = fsub double %97, %99
  store double %100, double* %96, align 8
  br label %._crit_edge140.prol.loopexit

._crit_edge140.prol.loopexit:                     ; preds = %._crit_edge140.prol, %._crit_edge140.preheader
  %indvars.iv123148.unr.ph = phi i64 [ 1, %._crit_edge140.prol ], [ 0, %._crit_edge140.preheader ]
  %101 = icmp eq i32 %0, 2
  br i1 %101, label %._crit_edge88.us, label %._crit_edge140.preheader.new

._crit_edge140.preheader.new:                     ; preds = %._crit_edge140.prol.loopexit
  br label %._crit_edge140

._crit_edge140:                                   ; preds = %._crit_edge140, %._crit_edge140.preheader.new
  %indvars.iv123148 = phi i64 [ %indvars.iv123148.unr.ph, %._crit_edge140.preheader.new ], [ %indvars.iv.next124.1, %._crit_edge140 ]
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123148, 1
  %sunkaddr194 = ptrtoint [1200 x double]* %43 to i64
  %sunkaddr195 = mul i64 %indvars.iv129, 8
  %sunkaddr196 = add i64 %sunkaddr194, %sunkaddr195
  %sunkaddr197 = inttoptr i64 %sunkaddr196 to double*
  %.pre = load double, double* %sunkaddr197, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next124, i64 %indvars.iv129
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next124, i64 %indvars.iv133
  %105 = load double, double* %104, align 8
  %106 = fmul double %105, %.pre
  %107 = fsub double %103, %106
  store double %107, double* %102, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123148, 2
  %.pre.1 = load double, double* %sunkaddr197, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next124.1, i64 %indvars.iv129
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next124.1, i64 %indvars.iv133
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %.pre.1
  %113 = fsub double %109, %112
  store double %113, double* %108, align 8
  %exitcond145.1 = icmp eq i64 %indvars.iv.next124.1, %9
  br i1 %exitcond145.1, label %._crit_edge88.us.loopexit, label %._crit_edge140

._crit_edge88.us.loopexit:                        ; preds = %._crit_edge140
  br label %._crit_edge88.us

._crit_edge88.us:                                 ; preds = %._crit_edge88.us.loopexit, %._crit_edge140.prol.loopexit, %.lr.ph87.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, %10
  br i1 %exitcond132, label %.loopexit.loopexit, label %.lr.ph91.split.us

._crit_edge93.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader25.us.preheader, label %._crit_edge35

.preheader25.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count47 = zext i32 %1 to i64
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge32.us, %.preheader25.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next50, %._crit_edge32.us ]
  %11 = mul nsw i64 %indvars.iv49, %10
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge, %.preheader25.us
  %indvars.iv45 = phi i64 [ 0, %.preheader25.us ], [ %indvars.iv.next46, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv45, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge53
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc38.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge53, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge32.us, label %._crit_edge53

._crit_edge32.us:                                 ; preds = %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count47
  br i1 %exitcond52, label %._crit_edge35.loopexit, label %.preheader25.us

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %4
  %22 = icmp sgt i32 %1, 0
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %27 = icmp sgt i32 %0, 0
  %or.cond = and i1 %27, %22
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %._crit_edge35
  %28 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %29 = mul nsw i64 %indvars.iv40, %28
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge54, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge54 ]
  %30 = add nsw i64 %indvars.iv, %29
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %._crit_edge54

; <label>:34:                                     ; preds = %._crit_edge55
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %35) #6
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge55, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge55

._crit_edge.us:                                   ; preds = %._crit_edge54
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge35
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %42) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
