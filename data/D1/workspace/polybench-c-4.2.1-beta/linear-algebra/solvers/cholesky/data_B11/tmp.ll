; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count139 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv137 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next138, %._crit_edge88 ]
  %indvars.iv135 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next136, %._crit_edge88 ]
  %9 = mul nuw nsw i64 %indvars.iv137, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep131132 = bitcast double* %scevgep131 to i8*
  %11 = sub i64 %7, %indvars.iv137
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %15 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %15, label %._crit_edge88.loopexit, label %._crit_edge88

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv119 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next120, %._crit_edge ]
  %16 = sub nsw i64 0, %indvars.iv119
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv119
  store double %21, double* %22, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next120, %indvars.iv135
  br i1 %exitcond126, label %.preheader61, label %._crit_edge

._crit_edge88.loopexit:                           ; preds = %.preheader61
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep131132, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %.preheader61, %._crit_edge88.loopexit
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %23, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  br i1 %exitcond140, label %._crit_edge90, label %.lr.ph84

._crit_edge90:                                    ; preds = %._crit_edge88
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %30 = add nsw i64 %wide.trip.count139, -1
  %xtraiter191 = and i64 %wide.trip.count139, 7
  %lcmp.mod192 = icmp eq i64 %xtraiter191, 0
  br i1 %lcmp.mod192, label %._crit_edge81.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %._crit_edge90
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol, %._crit_edge81.us.prol.preheader
  %indvars.iv115.prol = phi i64 [ 0, %._crit_edge81.us.prol.preheader ], [ %indvars.iv.next116.prol, %._crit_edge81.us.prol ]
  %prol.iter193 = phi i64 [ %xtraiter191, %._crit_edge81.us.prol.preheader ], [ %prol.iter193.sub, %._crit_edge81.us.prol ]
  %31 = mul nuw nsw i64 %indvars.iv115.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next116.prol = add nuw nsw i64 %indvars.iv115.prol, 1
  %prol.iter193.sub = add i64 %prol.iter193, -1
  %prol.iter193.cmp = icmp eq i64 %prol.iter193.sub, 0
  br i1 %prol.iter193.cmp, label %._crit_edge81.us.prol.loopexit.unr-lcssa, label %._crit_edge81.us.prol, !llvm.loop !1

._crit_edge81.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge81.us.prol
  br label %._crit_edge81.us.prol.loopexit

._crit_edge81.us.prol.loopexit:                   ; preds = %._crit_edge90, %._crit_edge81.us.prol.loopexit.unr-lcssa
  %indvars.iv115.unr = phi i64 [ 0, %._crit_edge90 ], [ %indvars.iv.next116.prol, %._crit_edge81.us.prol.loopexit.unr-lcssa ]
  %32 = icmp ult i64 %30, 7
  br i1 %32, label %.preheader57.us.us.preheader.preheader, label %._crit_edge90.new

._crit_edge90.new:                                ; preds = %._crit_edge81.us.prol.loopexit
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us, %._crit_edge90.new
  %indvars.iv115 = phi i64 [ %indvars.iv115.unr, %._crit_edge90.new ], [ %indvars.iv.next116.7, %._crit_edge81.us ]
  %33 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %34 = mul i64 %indvars.iv115, 16000
  %35 = add i64 %34, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %36 = mul i64 %indvars.iv115, 16000
  %37 = add i64 %36, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %38 = mul i64 %indvars.iv115, 16000
  %39 = add i64 %38, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %40 = mul i64 %indvars.iv115, 16000
  %41 = add i64 %40, 64000
  %scevgep.4 = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %29, i32 8, i1 false)
  %42 = mul i64 %indvars.iv115, 16000
  %43 = add i64 %42, 80000
  %scevgep.5 = getelementptr i8, i8* %24, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %29, i32 8, i1 false)
  %44 = mul i64 %indvars.iv115, 16000
  %45 = add i64 %44, 96000
  %scevgep.6 = getelementptr i8, i8* %24, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %29, i32 8, i1 false)
  %46 = mul i64 %indvars.iv115, 16000
  %47 = add i64 %46, 112000
  %scevgep.7 = getelementptr i8, i8* %24, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next116.7 = add nsw i64 %indvars.iv115, 8
  %exitcond118.7 = icmp eq i64 %indvars.iv.next116.7, %wide.trip.count139
  br i1 %exitcond118.7, label %.preheader57.us.us.preheader.preheader.unr-lcssa, label %._crit_edge81.us

.preheader57.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge81.us
  br label %.preheader57.us.us.preheader.preheader

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge81.us.prol.loopexit, %.preheader57.us.us.preheader.preheader.unr-lcssa
  %48 = shl nuw nsw i64 %wide.trip.count139, 3
  %49 = add nsw i64 %wide.trip.count139, -1
  %min.iters.check = icmp ult i32 %0, 4
  %50 = and i32 %0, 3
  %n.mod.vf = zext i32 %50 to i64
  %n.vec = sub nsw i64 %wide.trip.count139, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %50, 0
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv107
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  %51 = add i64 %indvars.iv107, -1999
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 %wide.trip.count139, i64 %51
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count139
  br i1 %exitcond110, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next104, %._crit_edge68.us.us ]
  %52 = mul i64 %indvars.iv103, 16000
  %scevgep146 = getelementptr i8, i8* %24, i64 %52
  %53 = add i64 %48, %52
  %scevgep147 = getelementptr i8, i8* %24, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv107
  br i1 %min.iters.check, label %._crit_edge141.preheader, label %min.iters.checked

._crit_edge141.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader57.us.us
  %indvars.iv99.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader57.us.us ], [ %n.vec, %middle.block ]
  %55 = sub nsw i64 %wide.trip.count139, %indvars.iv99.ph
  %xtraiter189 = and i64 %55, 1
  %lcmp.mod190 = icmp eq i64 %xtraiter189, 0
  br i1 %lcmp.mod190, label %._crit_edge141.prol.loopexit.unr-lcssa, label %._crit_edge141.prol.preheader

._crit_edge141.prol.preheader:                    ; preds = %._crit_edge141.preheader
  br label %._crit_edge141.prol

._crit_edge141.prol:                              ; preds = %._crit_edge141.prol.preheader
  %56 = load double, double* %54, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99.ph, i64 %indvars.iv107
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %indvars.iv99.ph
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next100.prol = add nuw nsw i64 %indvars.iv99.ph, 1
  br label %._crit_edge141.prol.loopexit.unr-lcssa

._crit_edge141.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge141.preheader, %._crit_edge141.prol
  %indvars.iv99.unr.ph = phi i64 [ %indvars.iv.next100.prol, %._crit_edge141.prol ], [ %indvars.iv99.ph, %._crit_edge141.preheader ]
  br label %._crit_edge141.prol.loopexit

._crit_edge141.prol.loopexit:                     ; preds = %._crit_edge141.prol.loopexit.unr-lcssa
  %63 = icmp eq i64 %49, %indvars.iv99.ph
  br i1 %63, label %._crit_edge68.us.us.loopexit, label %._crit_edge141.preheader.new

._crit_edge141.preheader.new:                     ; preds = %._crit_edge141.prol.loopexit
  br label %._crit_edge141

min.iters.checked:                                ; preds = %.preheader57.us.us
  br i1 %cmp.zero, label %._crit_edge141.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep146, %scevgep150151
  %bound1 = icmp ult i8* %scevgep148149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
  %bc152 = bitcast double* %54 to i8*
  %bound0153 = icmp ult i8* %scevgep146, %bc152
  %bound1154 = icmp ult i8* %bc, %scevgep147
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %._crit_edge141.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %64 = load double, double* %54, align 8, !alias.scope !3
  %65 = insertelement <2 x double> undef, double %64, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = insertelement <2 x double> undef, double %64, i32 0
  %68 = shufflevector <2 x double> %67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %69 = or i64 %index, 1
  %70 = or i64 %index, 2
  %71 = or i64 %index, 3
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv107
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %69, i64 %indvars.iv107
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %70, i64 %indvars.iv107
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %71, i64 %indvars.iv107
  %76 = load double, double* %72, align 8, !alias.scope !6
  %77 = load double, double* %73, align 8, !alias.scope !6
  %78 = load double, double* %74, align 8, !alias.scope !6
  %79 = load double, double* %75, align 8, !alias.scope !6
  %80 = insertelement <2 x double> undef, double %76, i32 0
  %81 = insertelement <2 x double> %80, double %77, i32 1
  %82 = insertelement <2 x double> undef, double %78, i32 0
  %83 = insertelement <2 x double> %82, double %79, i32 1
  %84 = fmul <2 x double> %66, %81
  %85 = fmul <2 x double> %68, %83
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !8, !noalias !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !8, !noalias !10
  %90 = fadd <2 x double> %wide.load, %84
  %91 = fadd <2 x double> %wide.load157, %85
  %92 = bitcast double* %86 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !alias.scope !8, !noalias !10
  %93 = bitcast double* %88 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %94 = icmp eq i64 %index.next, %n.vec
  br i1 %94, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge68.us.us, label %._crit_edge141.preheader

._crit_edge68.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge141
  br label %._crit_edge68.us.us.loopexit

._crit_edge68.us.us.loopexit:                     ; preds = %._crit_edge141.prol.loopexit, %._crit_edge68.us.us.loopexit.unr-lcssa
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %middle.block
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count139
  br i1 %exitcond106, label %._crit_edge70.us, label %.preheader57.us.us

._crit_edge141:                                   ; preds = %._crit_edge141, %._crit_edge141.preheader.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %._crit_edge141.preheader.new ], [ %indvars.iv.next100.1, %._crit_edge141 ]
  %95 = load double, double* %54, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv107
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %100 = load double, double* %99, align 8
  %101 = fadd double %100, %98
  store double %101, double* %99, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %102 = load double, double* %54, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next100, i64 %indvars.iv107
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %107 = load double, double* %106, align 8
  %108 = fadd double %107, %105
  store double %108, double* %106, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count139
  br i1 %exitcond102.1, label %._crit_edge68.us.us.loopexit.unr-lcssa, label %._crit_edge141, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %109 = shl nuw nsw i64 %wide.trip.count139, 3
  %110 = add nsw i64 %wide.trip.count139, -1
  %min.iters.check161 = icmp ult i32 %0, 4
  %111 = and i32 %0, 3
  %n.mod.vf163 = zext i32 %111 to i64
  %n.vec164 = sub nsw i64 %wide.trip.count139, %n.mod.vf163
  %cmp.zero165 = icmp eq i64 %n.vec164, 0
  %cmp.n182 = icmp eq i32 %111, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 0
  %scevgep167168 = bitcast double* %scevgep167 to i8*
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %wide.trip.count139
  %scevgep169170 = bitcast double* %scevgep169 to i8*
  %112 = mul i64 %indvars.iv95, 16000
  %scevgep171 = getelementptr i8, i8* %24, i64 %112
  %113 = add i64 %109, %112
  %scevgep172 = getelementptr i8, i8* %24, i64 %113
  br i1 %min.iters.check161, label %._crit_edge142.preheader, label %min.iters.checked162

min.iters.checked162:                             ; preds = %.preheader.us
  br i1 %cmp.zero165, label %._crit_edge142.preheader, label %vector.memcheck177

vector.memcheck177:                               ; preds = %min.iters.checked162
  %bound0173 = icmp ult i8* %scevgep167168, %scevgep172
  %bound1174 = icmp ult i8* %scevgep171, %scevgep169170
  %memcheck.conflict176 = and i1 %bound0173, %bound1174
  br i1 %memcheck.conflict176, label %._crit_edge142.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %vector.memcheck177
  br label %vector.body158

vector.body158:                                   ; preds = %vector.body158.preheader, %vector.body158
  %index179 = phi i64 [ %index.next180, %vector.body158 ], [ 0, %vector.body158.preheader ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %index179
  %115 = bitcast double* %114 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %115, align 8, !alias.scope !15
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !15
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %index179
  %119 = bitcast double* %118 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %119, align 8, !alias.scope !18, !noalias !15
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %121, align 8, !alias.scope !18, !noalias !15
  %index.next180 = add i64 %index179, 4
  %122 = icmp eq i64 %index.next180, %n.vec164
  br i1 %122, label %middle.block159, label %vector.body158, !llvm.loop !20

middle.block159:                                  ; preds = %vector.body158
  br i1 %cmp.n182, label %._crit_edge.us, label %._crit_edge142.preheader

._crit_edge142.preheader:                         ; preds = %middle.block159, %vector.memcheck177, %min.iters.checked162, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck177 ], [ 0, %min.iters.checked162 ], [ 0, %.preheader.us ], [ %n.vec164, %middle.block159 ]
  %123 = sub nsw i64 %wide.trip.count139, %indvars.iv.ph
  %124 = sub nsw i64 %110, %indvars.iv.ph
  %xtraiter = and i64 %123, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge142.prol.loopexit, label %._crit_edge142.prol.preheader

._crit_edge142.prol.preheader:                    ; preds = %._crit_edge142.preheader
  br label %._crit_edge142.prol

._crit_edge142.prol:                              ; preds = %._crit_edge142.prol, %._crit_edge142.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge142.prol ], [ %indvars.iv.ph, %._crit_edge142.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge142.prol ], [ %xtraiter, %._crit_edge142.prol.preheader ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.prol
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge142.prol.loopexit.unr-lcssa, label %._crit_edge142.prol, !llvm.loop !21

._crit_edge142.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge142.prol
  br label %._crit_edge142.prol.loopexit

._crit_edge142.prol.loopexit:                     ; preds = %._crit_edge142.preheader, %._crit_edge142.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %._crit_edge142.preheader ], [ %indvars.iv.next.prol, %._crit_edge142.prol.loopexit.unr-lcssa ]
  %130 = icmp ult i64 %124, 3
  br i1 %130, label %._crit_edge.us.loopexit, label %._crit_edge142.preheader.new

._crit_edge142.preheader.new:                     ; preds = %._crit_edge142.prol.loopexit
  br label %._crit_edge142

._crit_edge142:                                   ; preds = %._crit_edge142, %._crit_edge142.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %._crit_edge142.preheader.new ], [ %indvars.iv.next.3, %._crit_edge142 ]
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count139
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge142, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge142
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge142.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block159
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count139
  br i1 %exitcond98, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %151 = phi i8* [ %4, %._crit_edge90.thread ], [ %24, %._crit_edge65.loopexit ]
  tail call void @free(i8* %151) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %2
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge39
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge39 ], [ 0, %.preheader33.preheader ]
  %4 = add i64 %indvars.iv65, -1
  %5 = icmp sgt i64 %indvars.iv65, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %.preheader33
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 0
  br label %.preheader

.lr.ph38:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre72 = load double, double* %7, align 8
  %xtraiter73 = and i64 %indvars.iv65, 3
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %._crit_edge70.prol.loopexit, label %._crit_edge70.prol.preheader

._crit_edge70.prol.preheader:                     ; preds = %.lr.ph38
  br label %._crit_edge70.prol

._crit_edge70.prol:                               ; preds = %._crit_edge70.prol, %._crit_edge70.prol.preheader
  %8 = phi double [ %.pre72, %._crit_edge70.prol.preheader ], [ %12, %._crit_edge70.prol ]
  %indvars.iv57.prol = phi i64 [ 0, %._crit_edge70.prol.preheader ], [ %indvars.iv.next58.prol, %._crit_edge70.prol ]
  %prol.iter = phi i64 [ %xtraiter73, %._crit_edge70.prol.preheader ], [ %prol.iter.sub, %._crit_edge70.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv57.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge70.prol.loopexit.unr-lcssa, label %._crit_edge70.prol, !llvm.loop !23

._crit_edge70.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge70.prol
  br label %._crit_edge70.prol.loopexit

._crit_edge70.prol.loopexit:                      ; preds = %.lr.ph38, %._crit_edge70.prol.loopexit.unr-lcssa
  %.unr75 = phi double [ %.pre72, %.lr.ph38 ], [ %12, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %indvars.iv57.unr = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next58.prol, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge39.loopexit, label %.lr.ph38.new

.lr.ph38.new:                                     ; preds = %._crit_edge70.prol.loopexit
  br label %._crit_edge70

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv49, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv49
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge69.preheader, label %._crit_edge

._crit_edge69.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge69.prol.loopexit.unr-lcssa, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %._crit_edge69.preheader
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge69.prol.loopexit.unr-lcssa

._crit_edge69.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge69.preheader, %._crit_edge69.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge69.prol ], [ undef, %._crit_edge69.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge69.prol ], [ %.pre, %._crit_edge69.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge69.prol ], [ 0, %._crit_edge69.preheader ]
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %._crit_edge69.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv49, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge69.preheader.new

._crit_edge69.preheader.new:                      ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge69.preheader.new ], [ %34, %._crit_edge69 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge69.preheader.new ], [ %indvars.iv.next.1, %._crit_edge69 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond48.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge69

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge69
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge69.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv49
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next50, %indvars.iv65
  br i1 %exitcond56, label %.lr.ph38, label %.preheader

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph38.new
  %39 = phi double [ %.unr75, %.lr.ph38.new ], [ %55, %._crit_edge70 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.lr.ph38.new ], [ %indvars.iv.next58.3, %._crit_edge70 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv57
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv65
  br i1 %exitcond64.3, label %._crit_edge39.loopexit.unr-lcssa, label %._crit_edge70

._crit_edge39.loopexit.unr-lcssa:                 ; preds = %._crit_edge70
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %._crit_edge70.prol.loopexit, %._crit_edge39.loopexit.unr-lcssa
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge42.loopexit, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge12

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv19 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv21, %8
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge25

; <label>:14:                                     ; preds = %._crit_edge26
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge26, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %indvars.iv19
  br i1 %exitcond18, label %._crit_edge, label %._crit_edge26

._crit_edge:                                      ; preds = %._crit_edge25
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond24, label %._crit_edge12.loopexit, label %.lr.ph

._crit_edge12.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
