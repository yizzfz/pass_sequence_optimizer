; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %18 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph64, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph64:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %10 = sext i32 %0 to i64
  %11 = fdiv double 0.000000e+00, %2
  %12 = icmp sgt i64 %10, 1
  %smax158 = select i1 %12, i64 %10, i64 1
  %min.iters.check = icmp ult i64 %smax158, 4
  br i1 %min.iters.check, label %.lr.ph64.split.preheader164, label %min.iters.checked

.lr.ph64.split.preheader164:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph64.split.preheader
  %indvars.iv144.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph64.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph64.split

min.iters.checked:                                ; preds = %.lr.ph64.split.preheader
  %n.vec = and i64 %smax158, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph64.split.preheader164, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert160 = insertelement <2 x double> undef, double %11, i32 0
  %broadcast.splat161 = shufflevector <2 x double> %broadcast.splatinsert160, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = add nsw i64 %n.vec, -4
  %14 = lshr exact i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %xtraiter174 = and i64 %15, 7
  %lcmp.mod175 = icmp eq i64 %xtraiter174, 0
  br i1 %lcmp.mod175, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter176 = phi i64 [ %xtraiter174, %vector.body.prol.preheader ], [ %prol.iter176.sub, %vector.body.prol ]
  %16 = getelementptr inbounds double, double* %5, i64 %index.prol
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %19, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter176.sub = add i64 %prol.iter176, -1
  %prol.iter176.cmp = icmp eq i64 %prol.iter176.sub, 0
  br i1 %prol.iter176.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %13, 28
  br i1 %20, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %21 = getelementptr inbounds double, double* %5, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = getelementptr inbounds double, double* %5, i64 %index.next
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %29 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %32, align 8
  %index.next.2 = add i64 %index, 12
  %33 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %36, align 8
  %index.next.3 = add i64 %index, 16
  %37 = getelementptr inbounds double, double* %5, i64 %index.next.3
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %40, align 8
  %index.next.4 = add i64 %index, 20
  %41 = getelementptr inbounds double, double* %5, i64 %index.next.4
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %42, align 8
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %44, align 8
  %index.next.5 = add i64 %index, 24
  %45 = getelementptr inbounds double, double* %5, i64 %index.next.5
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %46, align 8
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %48, align 8
  %index.next.6 = add i64 %index, 28
  %49 = getelementptr inbounds double, double* %5, i64 %index.next.6
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %50, align 8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %52, align 8
  %index.next.7 = add i64 %index, 32
  %53 = icmp eq i64 %index.next.7, %n.vec
  br i1 %53, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax158, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph64.split.preheader164

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %54 = add i32 %1, -1
  %55 = sext i32 %0 to i64
  %xtraiter138 = and i32 %1, 3
  %lcmp.mod139 = icmp eq i32 %xtraiter138, 0
  %56 = icmp ult i32 %54, 3
  %wide.trip.count134.3 = zext i32 %1 to i64
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge60.us
  %indvars.iv140 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge60.us ]
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv140
  store double 0.000000e+00, double* %57, align 8
  br i1 %lcmp.mod139, label %.prol.loopexit137, label %.prol.preheader136.preheader

.prol.preheader136.preheader:                     ; preds = %.lr.ph64.split.us
  br label %.prol.preheader136

.prol.preheader136:                               ; preds = %.prol.preheader136.preheader, %.prol.preheader136
  %58 = phi double [ %61, %.prol.preheader136 ], [ 0.000000e+00, %.prol.preheader136.preheader ]
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.prol.preheader136 ], [ 0, %.prol.preheader136.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader136 ], [ %xtraiter138, %.prol.preheader136.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132.prol, i64 %indvars.iv140
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %57, align 8
  %indvars.iv.next133.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit137.loopexit, label %.prol.preheader136, !llvm.loop !6

.prol.loopexit137.loopexit:                       ; preds = %.prol.preheader136
  br label %.prol.loopexit137

.prol.loopexit137:                                ; preds = %.prol.loopexit137.loopexit, %.lr.ph64.split.us
  %62 = phi double [ 0.000000e+00, %.lr.ph64.split.us ], [ %61, %.prol.loopexit137.loopexit ]
  %indvars.iv132.unr = phi i64 [ 0, %.lr.ph64.split.us ], [ %indvars.iv.next133.prol, %.prol.loopexit137.loopexit ]
  br i1 %56, label %._crit_edge60.us, label %.lr.ph64.split.us.new.preheader

.lr.ph64.split.us.new.preheader:                  ; preds = %.prol.loopexit137
  br label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.lr.ph64.split.us.new.preheader, %.lr.ph64.split.us.new
  %63 = phi double [ %75, %.lr.ph64.split.us.new ], [ %62, %.lr.ph64.split.us.new.preheader ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133.3, %.lr.ph64.split.us.new ], [ %indvars.iv132.unr, %.lr.ph64.split.us.new.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv132, i64 %indvars.iv140
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %57, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133, i64 %indvars.iv140
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %57, align 8
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.1, i64 %indvars.iv140
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %57, align 8
  %indvars.iv.next133.2 = add nsw i64 %indvars.iv132, 3
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next133.2, i64 %indvars.iv140
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %57, align 8
  %indvars.iv.next133.3 = add nsw i64 %indvars.iv132, 4
  %exitcond135.3 = icmp eq i64 %indvars.iv.next133.3, %wide.trip.count134.3
  br i1 %exitcond135.3, label %._crit_edge60.us.loopexit, label %.lr.ph64.split.us.new

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph64.split.us.new
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit137
  %76 = phi double [ %62, %.prol.loopexit137 ], [ %75, %._crit_edge60.us.loopexit ]
  %77 = fdiv double %76, %2
  store double %77, double* %57, align 8
  %indvars.iv.next141 = add nsw i64 %indvars.iv140, 1
  %78 = icmp slt i64 %indvars.iv.next141, %55
  br i1 %78, label %.lr.ph64.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge60.us
  br label %._crit_edge

._crit_edge.loopexit165:                          ; preds = %.lr.ph64.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit165, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph53, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph53:                                         ; preds = %._crit_edge
  br i1 %9, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %79 = sext i32 %0 to i64
  %80 = fdiv double 0.000000e+00, %2
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %81 = sext i32 %1 to i64
  %82 = sext i32 %0 to i64
  %xtraiter172 = and i64 %81, 1
  %lcmp.mod173 = icmp eq i64 %xtraiter172, 0
  %83 = icmp eq i32 %1, 1
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge10.us
  %indvars.iv126 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next127, %._crit_edge10.us ]
  %84 = getelementptr inbounds double, double* %6, i64 %indvars.iv126
  store double 0.000000e+00, double* %84, align 8
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv126
  br i1 %lcmp.mod173, label %.prol.loopexit171.unr-lcssa, label %.prol.preheader170

.prol.preheader170:                               ; preds = %.lr.ph53.split.us
  br label %86

; <label>:86:                                     ; preds = %.prol.preheader170
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv126
  %88 = load double, double* %87, align 8
  %89 = load double, double* %85, align 8
  %90 = fsub double %88, %89
  %91 = fmul double %90, %90
  %92 = fadd double %91, 0.000000e+00
  store double %92, double* %84, align 8
  br label %.prol.loopexit171.unr-lcssa

.prol.loopexit171.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %86
  %.unr.ph = phi double [ %92, %86 ], [ 0.000000e+00, %.lr.ph53.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %86 ], [ 0, %.lr.ph53.split.us ]
  %.lcssa167.unr.ph = phi double [ %92, %86 ], [ undef, %.lr.ph53.split.us ]
  br label %.prol.loopexit171

.prol.loopexit171:                                ; preds = %.prol.loopexit171.unr-lcssa
  br i1 %83, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit171
  br label %96

; <label>:93:                                     ; preds = %._crit_edge50.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge50.us, %93
  %94 = phi double [ %112, %93 ], [ 1.000000e+00, %._crit_edge50.us ]
  store double %94, double* %84, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %95 = icmp slt i64 %indvars.iv.next127, %82
  br i1 %95, label %.lr.ph53.split.us, label %.._crit_edge9_crit_edge.loopexit

; <label>:96:                                     ; preds = %96, %.lr.ph53.split.us.new
  %97 = phi double [ %.unr.ph, %.lr.ph53.split.us.new ], [ %109, %96 ]
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next124.1, %96 ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv126
  %99 = load double, double* %98, align 8
  %100 = load double, double* %85, align 8
  %101 = fsub double %99, %100
  %102 = fmul double %101, %101
  %103 = fadd double %102, %97
  store double %103, double* %84, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124, i64 %indvars.iv126
  %105 = load double, double* %104, align 8
  %106 = load double, double* %85, align 8
  %107 = fsub double %105, %106
  %108 = fmul double %107, %107
  %109 = fadd double %108, %103
  store double %109, double* %84, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %110 = icmp slt i64 %indvars.iv.next124.1, %81
  br i1 %110, label %96, label %._crit_edge50.us.unr-lcssa

._crit_edge50.us.unr-lcssa:                       ; preds = %96
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %.prol.loopexit171, %._crit_edge50.us.unr-lcssa
  %.lcssa167 = phi double [ %.lcssa167.unr.ph, %.prol.loopexit171 ], [ %109, %._crit_edge50.us.unr-lcssa ]
  %111 = fdiv double %.lcssa167, %2
  store double %111, double* %84, align 8
  %112 = tail call double @sqrt(double %111) #4
  store double %112, double* %84, align 8
  %113 = fcmp ugt double %112, 1.000000e-01
  br i1 %113, label %93, label %._crit_edge10.us

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader164, %.lr.ph64.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %.lr.ph64.split ], [ %indvars.iv144.ph, %.lr.ph64.split.preheader164 ]
  %114 = getelementptr inbounds double, double* %5, i64 %indvars.iv144
  store double %11, double* %114, align 8
  %indvars.iv.next145 = add nsw i64 %indvars.iv144, 1
  %115 = icmp slt i64 %indvars.iv.next145, %10
  br i1 %115, label %.lr.ph64.split, label %._crit_edge.loopexit165, !llvm.loop !7

.._crit_edge9_crit_edge.loopexit:                 ; preds = %._crit_edge10.us
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit163:              ; preds = %._crit_edge10
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit163, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %116 = icmp sgt i32 %1, 0
  br i1 %116, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  br i1 %8, label %._crit_edge11.us.preheader, label %.._crit_edge12_crit_edge.loopexit70

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %117 = sext i32 %0 to i64
  %118 = sext i32 %1 to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge43.us
  %indvars.iv121 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next122, %._crit_edge43.us ]
  br label %119

; <label>:119:                                    ; preds = %._crit_edge11.us, %119
  %indvars.iv119 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next120, %119 ]
  %120 = getelementptr inbounds double, double* %5, i64 %indvars.iv119
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv119
  %123 = load double, double* %122, align 8
  %124 = fsub double %123, %121
  store double %124, double* %122, align 8
  %125 = tail call double @sqrt(double %2) #4
  %126 = getelementptr inbounds double, double* %6, i64 %indvars.iv119
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = load double, double* %122, align 8
  %130 = fdiv double %129, %128
  store double %130, double* %122, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %131 = icmp slt i64 %indvars.iv.next120, %117
  br i1 %131, label %119, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %119
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %132 = icmp slt i64 %indvars.iv.next122, %118
  br i1 %132, label %._crit_edge11.us, label %.._crit_edge12_crit_edge.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader, %._crit_edge10
  %indvars.iv129 = phi i64 [ 0, %.lr.ph53.split.preheader ], [ %indvars.iv.next130, %._crit_edge10 ]
  %133 = getelementptr inbounds double, double* %6, i64 %indvars.iv129
  store double %80, double* %133, align 8
  %134 = tail call double @sqrt(double %80) #4
  store double %134, double* %133, align 8
  %135 = fcmp ugt double %134, 1.000000e-01
  br i1 %135, label %136, label %._crit_edge10

; <label>:136:                                    ; preds = %.lr.ph53.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph53.split, %136
  %137 = phi double [ %134, %136 ], [ 1.000000e+00, %.lr.ph53.split ]
  store double %137, double* %133, align 8
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %138 = icmp slt i64 %indvars.iv.next130, %79
  br i1 %138, label %.lr.ph53.split, label %.._crit_edge9_crit_edge.loopexit163

.._crit_edge12_crit_edge.loopexit:                ; preds = %._crit_edge43.us
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge.loopexit70:              ; preds = %._crit_edge11.lr.ph
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %.._crit_edge12_crit_edge.loopexit70, %.._crit_edge12_crit_edge.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.._crit_edge12_crit_edge, %._crit_edge9
  %139 = icmp sgt i32 %0, 1
  br i1 %139, label %.lr.ph23, label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12
  %.pre = add nsw i32 %0, -1
  br label %196

.lr.ph23:                                         ; preds = %._crit_edge12
  %140 = add nsw i32 %0, -1
  br i1 %116, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %141 = add i32 %0, -2
  %142 = add i32 %0, 1
  %143 = zext i32 %142 to i64
  %144 = zext i32 %141 to i64
  %145 = sext i32 %140 to i64
  %146 = sext i32 %0 to i64
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %147 = sext i32 %0 to i64
  %148 = sext i32 %140 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %149 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv96 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next97, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv87 = phi i64 [ 1, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next88, %._crit_edge19.us-lcssa.us.us ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %150, align 8
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, 1
  %151 = icmp slt i64 %indvars.iv.next97, %147
  br i1 %151, label %.lr.ph.us.us.preheader, label %._crit_edge19.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv96
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge14.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %153 = icmp slt i64 %indvars.iv.next97, %148
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  br i1 %153, label %.lr.ph23.split.us, label %._crit_edge24.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge14.us.us ], [ %indvars.iv87, %.lr.ph.us.us.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv89
  store double 0.000000e+00, double* %154, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %155 = load double, double* %152, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv89
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %158, 0.000000e+00
  store double %159, double* %154, align 8
  %160 = bitcast double %159 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %161 = phi i64 [ %160, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %162 = phi double [ %159, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %149, label %._crit_edge14.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %163 = bitcast double %179 to i64
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit
  %164 = phi i64 [ %161, %.prol.loopexit ], [ %163, %._crit_edge14.us.us.loopexit ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89, i64 %indvars.iv96
  %166 = bitcast double* %165 to i64*
  store i64 %164, i64* %166, align 8
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next90 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %._crit_edge19.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %167 = phi double [ %179, %.lr.ph.us.us.new ], [ %162, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv96
  %169 = load double, double* %168, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv89
  %171 = load double, double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fadd double %172, %167
  store double %173, double* %154, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv96
  %175 = load double, double* %174, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv89
  %177 = load double, double* %176, align 8
  %178 = fmul double %175, %177
  %179 = fadd double %178, %173
  store double %179, double* %154, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge14.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %._crit_edge19
  %indvars.iv115 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next116, %._crit_edge19 ]
  %indvar = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvar.next, %._crit_edge19 ]
  %indvars.iv100 = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv.next101, %._crit_edge19 ]
  %180 = sub i64 %144, %indvar
  %181 = trunc i64 %180 to i32
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %182, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %183 = icmp slt i64 %indvars.iv.next116, %146
  br i1 %183, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph23.split
  %184 = sub i64 %143, %indvar
  %xtraiter113148 = and i64 %184, 1
  %lcmp.mod114 = icmp eq i64 %xtraiter113148, 0
  br i1 %lcmp.mod114, label %.prol.loopexit112, label %.prol.preheader111

.prol.preheader111:                               ; preds = %.lr.ph18
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv100
  store double 0.000000e+00, double* %185, align 8
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv115
  %187 = bitcast double* %186 to i64*
  store i64 0, i64* %187, align 8
  %indvars.iv.next103.prol = add nsw i64 %indvars.iv100, 1
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.prol.preheader111, %.lr.ph18
  %indvars.iv102.unr.ph = phi i64 [ %indvars.iv.next103.prol, %.prol.preheader111 ], [ %indvars.iv100, %.lr.ph18 ]
  %188 = icmp eq i32 %181, 0
  br i1 %188, label %._crit_edge19, label %.lr.ph18.new.preheader

.lr.ph18.new.preheader:                           ; preds = %.prol.loopexit112
  br label %.lr.ph18.new

.lr.ph18.new:                                     ; preds = %.lr.ph18.new.preheader, %.lr.ph18.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph18.new ], [ %indvars.iv102.unr.ph, %.lr.ph18.new.preheader ]
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv102
  store double 0.000000e+00, double* %189, align 8
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv115
  %191 = bitcast double* %190 to i64*
  store i64 0, i64* %191, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv115, i64 %indvars.iv.next103
  store double 0.000000e+00, double* %192, align 8
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next103, i64 %indvars.iv115
  %194 = bitcast double* %193 to i64*
  store i64 0, i64* %194, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %lftr.wideiv108.1 = trunc i64 %indvars.iv.next103.1 to i32
  %exitcond109.1 = icmp eq i32 %lftr.wideiv108.1, %0
  br i1 %exitcond109.1, label %._crit_edge19.loopexit, label %.lr.ph18.new

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.new
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.prol.loopexit112, %.lr.ph23.split
  %195 = icmp slt i64 %indvars.iv.next116, %145
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %195, label %.lr.ph23.split, label %._crit_edge24.loopexit162

._crit_edge24.loopexit:                           ; preds = %._crit_edge19.us-lcssa.us.us
  br label %._crit_edge24

._crit_edge24.loopexit162:                        ; preds = %._crit_edge19
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit162, %._crit_edge24.loopexit
  br label %196

; <label>:196:                                    ; preds = %._crit_edge12._crit_edge, %._crit_edge24
  %.pre-phi = phi i32 [ %.pre, %._crit_edge12._crit_edge ], [ %140, %._crit_edge24 ]
  %197 = sext i32 %.pre-phi to i64
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %197, i64 %197
  store double 1.000000e+00, double* %198, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %22

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge5.loopexit9

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge3.us
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next12, %._crit_edge3.us ]
  %9 = mul nsw i64 %8, %indvars.iv11
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %21 = icmp slt i64 %indvars.iv.next12, %8
  br i1 %21, label %._crit_edge.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5.loopexit9:                           ; preds = %._crit_edge.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit9, %._crit_edge5.loopexit
  br label %22

; <label>:22:                                     ; preds = %._crit_edge5, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
