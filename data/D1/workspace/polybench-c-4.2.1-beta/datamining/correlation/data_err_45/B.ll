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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %4
  %indvars.iv13 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %19 ]
  %5 = trunc i64 %indvars.iv13 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = fadd double %6, %10
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.200000e+03
  %17 = fadd double %6, %16
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph137, label %.preheader106

.lr.ph137:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph137.split.us.preheader, label %.lr.ph137.split.preheader

.lr.ph137.split.preheader:                        ; preds = %.lr.ph137
  %10 = add i32 %0, -1
  %xtraiter209 = and i32 %0, 3
  %lcmp.mod210 = icmp eq i32 %xtraiter209, 0
  br i1 %lcmp.mod210, label %.lr.ph137.split.prol.loopexit, label %.lr.ph137.split.prol.preheader

.lr.ph137.split.prol.preheader:                   ; preds = %.lr.ph137.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  %12 = add nsw i32 %xtraiter209, -1
  br label %.lr.ph137.split.prol

.lr.ph137.split.prol:                             ; preds = %.lr.ph137.split.prol..lr.ph137.split.prol_crit_edge, %.lr.ph137.split.prol.preheader
  %indvars.iv205.prol = phi i64 [ %indvars.iv.next206.prol, %.lr.ph137.split.prol..lr.ph137.split.prol_crit_edge ], [ 0, %.lr.ph137.split.prol.preheader ]
  %prol.iter211 = phi i32 [ %prol.iter211.sub, %.lr.ph137.split.prol..lr.ph137.split.prol_crit_edge ], [ %xtraiter209, %.lr.ph137.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv205.prol
  store double %11, double* %13, align 8
  %prol.iter211.sub = add nsw i32 %prol.iter211, -1
  %prol.iter211.cmp = icmp eq i32 %prol.iter211.sub, 0
  br i1 %prol.iter211.cmp, label %.lr.ph137.split.prol.loopexit.loopexit, label %.lr.ph137.split.prol..lr.ph137.split.prol_crit_edge, !llvm.loop !1

.lr.ph137.split.prol..lr.ph137.split.prol_crit_edge: ; preds = %.lr.ph137.split.prol
  %indvars.iv.next206.prol = add nuw nsw i64 %indvars.iv205.prol, 1
  br label %.lr.ph137.split.prol

.lr.ph137.split.prol.loopexit.loopexit:           ; preds = %.lr.ph137.split.prol
  %14 = zext i32 %12 to i64
  %15 = add nuw nsw i64 %14, 1
  br label %.lr.ph137.split.prol.loopexit

.lr.ph137.split.prol.loopexit:                    ; preds = %.lr.ph137.split.preheader, %.lr.ph137.split.prol.loopexit.loopexit
  %indvars.iv205.unr = phi i64 [ %15, %.lr.ph137.split.prol.loopexit.loopexit ], [ 0, %.lr.ph137.split.preheader ]
  %16 = icmp ult i32 %10, 3
  br i1 %16, label %.lr.ph130, label %.lr.ph137.split.preheader217

.lr.ph137.split.preheader217:                     ; preds = %.lr.ph137.split.prol.loopexit
  %17 = fdiv double 0.000000e+00, %2
  %wide.trip.count207.3 = zext i32 %0 to i64
  %18 = add nsw i64 %wide.trip.count207.3, -4
  %19 = sub nsw i64 %18, %indvars.iv205.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph137.split.preheader237, label %min.iters.checked

.lr.ph137.split.preheader237:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph137.split.preheader217
  %indvars.iv205.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv205.unr, %min.iters.checked ], [ %indvars.iv205.unr, %.lr.ph137.split.preheader217 ]
  br label %.lr.ph137.split

min.iters.checked:                                ; preds = %.lr.ph137.split.preheader217
  %n.mod.vf = and i64 %21, 3
  %n.vec = sub nsw i64 %21, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %22 = shl nuw i64 %20, 2
  %23 = add i64 %indvars.iv205.unr, %22
  %24 = add i64 %23, 4
  %25 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero, label %.lr.ph137.split.preheader237, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert231 = insertelement <2 x double> undef, double %17, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert231, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv205.unr, %26
  %27 = add i64 %indvars.iv205.unr, %26
  %28 = add nsw i64 %27, 3
  %29 = add i64 %offset.idx, 11
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = getelementptr double, double* %31, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.lr.ph130, label %.lr.ph137.split.preheader237

.lr.ph137.split.us.preheader:                     ; preds = %.lr.ph137
  %37 = add i32 %1, -1
  %xtraiter198 = and i32 %1, 3
  %lcmp.mod199 = icmp eq i32 %xtraiter198, 0
  %38 = icmp ult i32 %37, 3
  %wide.trip.count203 = zext i32 %0 to i64
  %wide.trip.count194.3 = zext i32 %1 to i64
  %39 = add nsw i32 %xtraiter198, -1
  %40 = zext i32 %39 to i64
  %41 = add nuw nsw i64 %40, 1
  br label %.lr.ph137.split.us

.lr.ph137.split.us:                               ; preds = %._crit_edge134.us, %.lr.ph137.split.us.preheader
  %indvars.iv201 = phi i64 [ 0, %.lr.ph137.split.us.preheader ], [ %indvars.iv.next202, %._crit_edge134.us ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv201
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod199, label %.prol.loopexit197, label %.prol.preheader196.preheader

.prol.preheader196.preheader:                     ; preds = %.lr.ph137.split.us
  br label %.prol.preheader196

.prol.preheader196:                               ; preds = %.prol.preheader196.preheader, %.prol.preheader196..prol.preheader196_crit_edge
  %43 = phi double [ %46, %.prol.preheader196..prol.preheader196_crit_edge ], [ 0.000000e+00, %.prol.preheader196.preheader ]
  %indvars.iv192.prol = phi i64 [ %indvars.iv.next193.prol, %.prol.preheader196..prol.preheader196_crit_edge ], [ 0, %.prol.preheader196.preheader ]
  %prol.iter200 = phi i32 [ %prol.iter200.sub, %.prol.preheader196..prol.preheader196_crit_edge ], [ %xtraiter198, %.prol.preheader196.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv192.prol, i64 %indvars.iv201
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %42, align 8
  %prol.iter200.sub = add nsw i32 %prol.iter200, -1
  %prol.iter200.cmp = icmp eq i32 %prol.iter200.sub, 0
  br i1 %prol.iter200.cmp, label %.prol.loopexit197.loopexit, label %.prol.preheader196..prol.preheader196_crit_edge, !llvm.loop !6

.prol.preheader196..prol.preheader196_crit_edge:  ; preds = %.prol.preheader196
  %indvars.iv.next193.prol = add nuw nsw i64 %indvars.iv192.prol, 1
  br label %.prol.preheader196

.prol.loopexit197.loopexit:                       ; preds = %.prol.preheader196
  br label %.prol.loopexit197

.prol.loopexit197:                                ; preds = %.prol.loopexit197.loopexit, %.lr.ph137.split.us
  %47 = phi double [ 0.000000e+00, %.lr.ph137.split.us ], [ %46, %.prol.loopexit197.loopexit ]
  %indvars.iv192.unr = phi i64 [ 0, %.lr.ph137.split.us ], [ %41, %.prol.loopexit197.loopexit ]
  br i1 %38, label %._crit_edge134.us, label %.lr.ph137.split.us.new.preheader

.lr.ph137.split.us.new.preheader:                 ; preds = %.prol.loopexit197
  br label %.lr.ph137.split.us.new

.lr.ph137.split.us.new:                           ; preds = %.lr.ph137.split.us.new.preheader, %.lr.ph137.split.us.new
  %48 = phi double [ %60, %.lr.ph137.split.us.new ], [ %47, %.lr.ph137.split.us.new.preheader ]
  %indvars.iv192 = phi i64 [ %indvars.iv.next193.3, %.lr.ph137.split.us.new ], [ %indvars.iv192.unr, %.lr.ph137.split.us.new.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv192, i64 %indvars.iv201
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %42, align 8
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next193, i64 %indvars.iv201
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %42, align 8
  %indvars.iv.next193.1 = add nsw i64 %indvars.iv192, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next193.1, i64 %indvars.iv201
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %42, align 8
  %indvars.iv.next193.2 = add nsw i64 %indvars.iv192, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next193.2, i64 %indvars.iv201
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %42, align 8
  %indvars.iv.next193.3 = add nsw i64 %indvars.iv192, 4
  %exitcond195.3 = icmp eq i64 %indvars.iv.next193.3, %wide.trip.count194.3
  br i1 %exitcond195.3, label %._crit_edge134.us.loopexit, label %.lr.ph137.split.us.new

._crit_edge134.us.loopexit:                       ; preds = %.lr.ph137.split.us.new
  br label %._crit_edge134.us

._crit_edge134.us:                                ; preds = %._crit_edge134.us.loopexit, %.prol.loopexit197
  %61 = phi double [ %47, %.prol.loopexit197 ], [ %60, %._crit_edge134.us.loopexit ]
  %62 = fdiv double %61, %2
  store double %62, double* %42, align 8
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %exitcond204 = icmp eq i64 %indvars.iv.next202, %wide.trip.count203
  br i1 %exitcond204, label %.lr.ph130.loopexit, label %.lr.ph137.split.us

.lr.ph130.loopexit:                               ; preds = %._crit_edge134.us
  br label %.lr.ph130

.lr.ph130.loopexit238:                            ; preds = %.lr.ph137.split
  br label %.lr.ph130

.lr.ph130:                                        ; preds = %.lr.ph130.loopexit238, %.lr.ph130.loopexit, %middle.block, %.lr.ph137.split.prol.loopexit
  br i1 %9, label %.lr.ph130.split.us.preheader, label %.lr.ph130.split.preheader

.lr.ph130.split.us.preheader:                     ; preds = %.lr.ph130
  %xtraiter180 = and i32 %1, 1
  %lcmp.mod181 = icmp eq i32 %xtraiter180, 0
  %63 = icmp eq i32 %1, 1
  %wide.trip.count184 = zext i32 %0 to i64
  %wide.trip.count176.1 = zext i32 %1 to i64
  br label %.lr.ph130.split.us

.lr.ph130.split.preheader:                        ; preds = %.lr.ph130
  %xtraiter190 = and i32 %0, 1
  %lcmp.mod191 = icmp eq i32 %xtraiter190, 0
  br i1 %lcmp.mod191, label %.lr.ph130.split.prol.loopexit, label %.lr.ph130.split.prol

.lr.ph130.split.prol:                             ; preds = %.lr.ph130.split.preheader
  %64 = fdiv double 0.000000e+00, %2
  store double %64, double* %6, align 8
  %65 = tail call double @sqrt(double %64) #4
  %66 = fcmp ole double %65, 1.000000e-01
  %67 = select i1 %66, double 1.000000e+00, double %65
  store double %67, double* %6, align 8
  br label %.lr.ph130.split.prol.loopexit

.lr.ph130.split.prol.loopexit:                    ; preds = %.lr.ph130.split.preheader, %.lr.ph130.split.prol
  %indvars.iv186.unr = phi i64 [ 1, %.lr.ph130.split.prol ], [ 0, %.lr.ph130.split.preheader ]
  %68 = icmp eq i32 %0, 1
  br i1 %68, label %.preheader106, label %.lr.ph130.split.preheader215

.lr.ph130.split.preheader215:                     ; preds = %.lr.ph130.split.prol.loopexit
  %69 = fdiv double 0.000000e+00, %2
  %wide.trip.count188.1 = zext i32 %0 to i64
  br label %.lr.ph130.split

.lr.ph130.split.us:                               ; preds = %._crit_edge128.us, %.lr.ph130.split.us.preheader
  %indvars.iv182 = phi i64 [ 0, %.lr.ph130.split.us.preheader ], [ %indvars.iv.next183, %._crit_edge128.us ]
  %70 = getelementptr inbounds double, double* %6, i64 %indvars.iv182
  store double 0.000000e+00, double* %70, align 8
  %71 = getelementptr inbounds double, double* %5, i64 %indvars.iv182
  br i1 %lcmp.mod181, label %.prol.loopexit179, label %.prol.preheader178

.prol.preheader178:                               ; preds = %.lr.ph130.split.us
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv182
  %73 = load double, double* %72, align 8
  %74 = load double, double* %71, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = fadd double %76, 0.000000e+00
  store double %77, double* %70, align 8
  br label %.prol.loopexit179

.prol.loopexit179:                                ; preds = %.lr.ph130.split.us, %.prol.preheader178
  %78 = phi double [ %77, %.prol.preheader178 ], [ 0.000000e+00, %.lr.ph130.split.us ]
  %indvars.iv174.unr.ph = phi i64 [ 1, %.prol.preheader178 ], [ 0, %.lr.ph130.split.us ]
  br i1 %63, label %._crit_edge128.us, label %.lr.ph130.split.us.new.preheader

.lr.ph130.split.us.new.preheader:                 ; preds = %.prol.loopexit179
  br label %.lr.ph130.split.us.new

.lr.ph130.split.us.new:                           ; preds = %.lr.ph130.split.us.new.preheader, %.lr.ph130.split.us.new
  %79 = phi double [ %91, %.lr.ph130.split.us.new ], [ %78, %.lr.ph130.split.us.new.preheader ]
  %indvars.iv174 = phi i64 [ %indvars.iv.next175.1, %.lr.ph130.split.us.new ], [ %indvars.iv174.unr.ph, %.lr.ph130.split.us.new.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv182
  %81 = load double, double* %80, align 8
  %82 = load double, double* %71, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %79, %84
  store double %85, double* %70, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv182
  %87 = load double, double* %86, align 8
  %88 = load double, double* %71, align 8
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %85, %90
  store double %91, double* %70, align 8
  %indvars.iv.next175.1 = add nuw nsw i64 %indvars.iv174, 2
  %exitcond177.1 = icmp eq i64 %indvars.iv.next175.1, %wide.trip.count176.1
  br i1 %exitcond177.1, label %._crit_edge128.us.loopexit, label %.lr.ph130.split.us.new

._crit_edge128.us.loopexit:                       ; preds = %.lr.ph130.split.us.new
  br label %._crit_edge128.us

._crit_edge128.us:                                ; preds = %._crit_edge128.us.loopexit, %.prol.loopexit179
  %92 = phi double [ %78, %.prol.loopexit179 ], [ %91, %._crit_edge128.us.loopexit ]
  %93 = fdiv double %92, %2
  store double %93, double* %70, align 8
  %94 = tail call double @sqrt(double %93) #4
  %95 = fcmp ole double %94, 1.000000e-01
  %96 = select i1 %95, double 1.000000e+00, double %94
  store double %96, double* %70, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond185 = icmp eq i64 %indvars.iv.next183, %wide.trip.count184
  br i1 %exitcond185, label %.preheader106.loopexit, label %.lr.ph130.split.us

.lr.ph137.split:                                  ; preds = %.lr.ph137.split.preheader237, %.lr.ph137.split
  %indvars.iv205 = phi i64 [ %indvars.iv.next206.3, %.lr.ph137.split ], [ %indvars.iv205.ph, %.lr.ph137.split.preheader237 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv205
  store double %17, double* %97, align 8
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next206
  store double %17, double* %98, align 8
  %indvars.iv.next206.1 = add nsw i64 %indvars.iv205, 2
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next206.1
  store double %17, double* %99, align 8
  %indvars.iv.next206.2 = add nsw i64 %indvars.iv205, 3
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next206.2
  store double %17, double* %100, align 8
  %indvars.iv.next206.3 = add nsw i64 %indvars.iv205, 4
  %exitcond208.3 = icmp eq i64 %indvars.iv.next206.3, %wide.trip.count207.3
  br i1 %exitcond208.3, label %.lr.ph130.loopexit238, label %.lr.ph137.split, !llvm.loop !7

.preheader106.loopexit:                           ; preds = %._crit_edge128.us
  br label %.preheader106

.preheader106.loopexit236:                        ; preds = %.lr.ph130.split
  br label %.preheader106

.preheader106:                                    ; preds = %.preheader106.loopexit236, %.preheader106.loopexit, %.lr.ph130.split.prol.loopexit, %7
  %101 = icmp sgt i32 %1, 0
  br i1 %101, label %.preheader105.lr.ph, label %.preheader

.preheader105.lr.ph:                              ; preds = %.preheader106
  br i1 %8, label %.preheader105.us.preheader, label %.preheader.thread

.preheader105.us.preheader:                       ; preds = %.preheader105.lr.ph
  %wide.trip.count167 = zext i32 %0 to i64
  %wide.trip.count171 = zext i32 %1 to i64
  br label %.preheader105.us

.preheader.thread:                                ; preds = %.preheader105.lr.ph
  %102 = add nsw i32 %0, -1
  br label %._crit_edge114

.preheader105.us:                                 ; preds = %._crit_edge123.us, %.preheader105.us.preheader
  %indvars.iv169 = phi i64 [ 0, %.preheader105.us.preheader ], [ %indvars.iv.next170, %._crit_edge123.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader105.us
  %indvars.iv165 = phi i64 [ 0, %.preheader105.us ], [ %indvars.iv.next166, %._crit_edge ]
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv165
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv169, i64 %indvars.iv165
  %106 = load double, double* %105, align 8
  %107 = fsub double %106, %104
  store double %107, double* %105, align 8
  %108 = tail call double @sqrt(double %2) #4
  %109 = getelementptr inbounds double, double* %6, i64 %indvars.iv165
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = load double, double* %105, align 8
  %113 = fdiv double %112, %111
  store double %113, double* %105, align 8
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next166, %wide.trip.count167
  br i1 %exitcond168, label %._crit_edge123.us, label %._crit_edge

._crit_edge123.us:                                ; preds = %._crit_edge
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %exitcond172 = icmp eq i64 %indvars.iv.next170, %wide.trip.count171
  br i1 %exitcond172, label %.preheader.loopexit, label %.preheader105.us

.lr.ph130.split:                                  ; preds = %.lr.ph130.split, %.lr.ph130.split.preheader215
  %indvars.iv186 = phi i64 [ %indvars.iv186.unr, %.lr.ph130.split.preheader215 ], [ %indvars.iv.next187.1, %.lr.ph130.split ]
  %114 = getelementptr inbounds double, double* %6, i64 %indvars.iv186
  store double %69, double* %114, align 8
  %115 = tail call double @sqrt(double %69) #4
  %116 = fcmp ole double %115, 1.000000e-01
  %117 = select i1 %116, double 1.000000e+00, double %115
  store double %117, double* %114, align 8
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next187
  store double %69, double* %118, align 8
  %119 = tail call double @sqrt(double %69) #4
  %120 = fcmp ole double %119, 1.000000e-01
  %121 = select i1 %120, double 1.000000e+00, double %119
  store double %121, double* %118, align 8
  %indvars.iv.next187.1 = add nsw i64 %indvars.iv186, 2
  %exitcond189.1 = icmp eq i64 %indvars.iv.next187.1, %wide.trip.count188.1
  br i1 %exitcond189.1, label %.preheader106.loopexit236, label %.lr.ph130.split

.preheader.loopexit:                              ; preds = %._crit_edge123.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader106
  %122 = add nsw i32 %0, -1
  %123 = icmp sgt i32 %0, 1
  br i1 %123, label %.lr.ph113, label %._crit_edge114

.lr.ph113:                                        ; preds = %.preheader
  br i1 %101, label %.lr.ph113.split.us.preheader, label %.lr.ph113.split.preheader

.lr.ph113.split.preheader:                        ; preds = %.lr.ph113
  %124 = zext i32 %122 to i64
  %125 = add i32 %0, -2
  %126 = zext i32 %125 to i64
  %127 = sext i32 %0 to i64
  %wide.trip.count156.3 = zext i32 %0 to i64
  %128 = trunc i32 %122 to i2
  br label %.lr.ph113.split

.lr.ph113.split.us.preheader:                     ; preds = %.lr.ph113
  %129 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %130 = icmp eq i32 %1, 1
  %wide.trip.count146 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count150 = zext i32 %122 to i64
  br label %.lr.ph113.split.us

.lr.ph113.split.us:                               ; preds = %.loopexit.us..lr.ph113.split.us_crit_edge, %.lr.ph113.split.us.preheader
  %indvars.iv148 = phi i64 [ 0, %.lr.ph113.split.us.preheader ], [ %indvars.iv.next149, %.loopexit.us..lr.ph113.split.us_crit_edge ]
  %indvars.iv142 = phi i64 [ 1, %.lr.ph113.split.us.preheader ], [ %indvars.iv.next143, %.loopexit.us..lr.ph113.split.us_crit_edge ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv148, i64 %indvars.iv148
  store double 1.000000e+00, double* %131, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %132 = icmp slt i64 %indvars.iv.next149, %129
  br i1 %132, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph113.split.us
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv148
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph113.split.us
  %exitcond151 = icmp eq i64 %indvars.iv.next149, %wide.trip.count150
  br i1 %exitcond151, label %._crit_edge114.loopexit, label %.loopexit.us..lr.ph113.split.us_crit_edge

.loopexit.us..lr.ph113.split.us_crit_edge:        ; preds = %.loopexit.us
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  br label %.lr.ph113.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv144 = phi i64 [ %indvars.iv142, %.lr.ph.us.us.preheader ], [ %indvars.iv.next145, %._crit_edge.us.us ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv148, i64 %indvars.iv144
  store double 0.000000e+00, double* %134, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %135 = load double, double* %133, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv144
  %137 = load double, double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %138, 0.000000e+00
  store double %139, double* %134, align 8
  %140 = bitcast double %139 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %141 = phi i64 [ %140, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %142 = phi double [ %139, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %130, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %143 = bitcast double %159 to i64
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.loopexit
  %144 = phi i64 [ %143, %._crit_edge.us.us.loopexit ], [ %141, %.prol.loopexit ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv148
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond = icmp eq i64 %indvars.iv.next145, %wide.trip.count146
  br i1 %exitcond, label %.loopexit.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %147 = phi double [ %159, %.lr.ph.us.us.new ], [ %142, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv148
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv144
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = fadd double %147, %152
  store double %153, double* %134, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv148
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv144
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %134, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %.lr.ph111.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph111.split.prol.loopexit, %.lr.ph113.split
  %exitcond164 = icmp eq i64 %indvars.iv.next162, %124
  br i1 %exitcond164, label %._crit_edge114.loopexit235, label %.loopexit..lr.ph113.split_crit_edge

.loopexit..lr.ph113.split_crit_edge:              ; preds = %.loopexit
  %indvars.iv.next226 = add i2 %indvars.iv225, -1
  %indvars.iv.next224 = add nuw i64 %indvars.iv223, 1
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  br label %.lr.ph113.split

.lr.ph113.split:                                  ; preds = %.loopexit..lr.ph113.split_crit_edge, %.lr.ph113.split.preheader
  %indvars.iv225 = phi i2 [ %indvars.iv.next226, %.loopexit..lr.ph113.split_crit_edge ], [ %128, %.lr.ph113.split.preheader ]
  %indvars.iv223 = phi i64 [ %indvars.iv.next224, %.loopexit..lr.ph113.split_crit_edge ], [ 2, %.lr.ph113.split.preheader ]
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %.loopexit..lr.ph113.split_crit_edge ], [ 0, %.lr.ph113.split.preheader ]
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %.loopexit..lr.ph113.split_crit_edge ], [ 1, %.lr.ph113.split.preheader ]
  %160 = zext i2 %indvars.iv225 to i64
  %161 = add nuw nsw i64 %160, 4294967295
  %162 = and i64 %161, 4294967295
  %163 = add i64 %indvars.iv223, %162
  %164 = sub i64 %126, %indvars.iv161
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv161
  store double 1.000000e+00, double* %166, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %167 = icmp slt i64 %indvars.iv.next162, %127
  br i1 %167, label %.lr.ph111.split.preheader, label %.loopexit

.lr.ph111.split.preheader:                        ; preds = %.lr.ph113.split
  %168 = sub i64 %124, %indvars.iv161
  %169 = trunc i64 %168 to i32
  %xtraiter159 = and i32 %169, 3
  %lcmp.mod160 = icmp eq i32 %xtraiter159, 0
  br i1 %lcmp.mod160, label %.lr.ph111.split.prol.loopexit, label %.lr.ph111.split.prol.preheader

.lr.ph111.split.prol.preheader:                   ; preds = %.lr.ph111.split.preheader
  br label %.lr.ph111.split.prol

.lr.ph111.split.prol:                             ; preds = %.lr.ph111.split.prol.preheader, %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge
  %indvars.iv154.prol = phi i64 [ %indvars.iv.next155.prol, %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge ], [ %indvars.iv152, %.lr.ph111.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge ], [ %xtraiter159, %.lr.ph111.split.prol.preheader ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv154.prol
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154.prol, i64 %indvars.iv161
  %172 = bitcast double* %171 to i64*
  store i64 0, i64* %172, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph111.split.prol.loopexit.loopexit, label %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge, !llvm.loop !9

.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge: ; preds = %.lr.ph111.split.prol
  %indvars.iv.next155.prol = add nuw nsw i64 %indvars.iv154.prol, 1
  br label %.lr.ph111.split.prol

.lr.ph111.split.prol.loopexit.loopexit:           ; preds = %.lr.ph111.split.prol
  br label %.lr.ph111.split.prol.loopexit

.lr.ph111.split.prol.loopexit:                    ; preds = %.lr.ph111.split.prol.loopexit.loopexit, %.lr.ph111.split.preheader
  %indvars.iv154.unr = phi i64 [ %indvars.iv152, %.lr.ph111.split.preheader ], [ %163, %.lr.ph111.split.prol.loopexit.loopexit ]
  %173 = icmp ult i32 %165, 3
  br i1 %173, label %.loopexit, label %.lr.ph111.split.preheader234

.lr.ph111.split.preheader234:                     ; preds = %.lr.ph111.split.prol.loopexit
  br label %.lr.ph111.split

.lr.ph111.split:                                  ; preds = %.lr.ph111.split.preheader234, %.lr.ph111.split
  %indvars.iv154 = phi i64 [ %indvars.iv.next155.3, %.lr.ph111.split ], [ %indvars.iv154.unr, %.lr.ph111.split.preheader234 ]
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv154
  store double 0.000000e+00, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154, i64 %indvars.iv161
  %176 = bitcast double* %175 to i64*
  store i64 0, i64* %176, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155, i64 %indvars.iv161
  %179 = bitcast double* %178 to i64*
  store i64 0, i64* %179, align 8
  %indvars.iv.next155.1 = add nsw i64 %indvars.iv154, 2
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155.1
  store double 0.000000e+00, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155.1, i64 %indvars.iv161
  %182 = bitcast double* %181 to i64*
  store i64 0, i64* %182, align 8
  %indvars.iv.next155.2 = add nsw i64 %indvars.iv154, 3
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155.2
  store double 0.000000e+00, double* %183, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155.2, i64 %indvars.iv161
  %185 = bitcast double* %184 to i64*
  store i64 0, i64* %185, align 8
  %indvars.iv.next155.3 = add nsw i64 %indvars.iv154, 4
  %exitcond157.3 = icmp eq i64 %indvars.iv.next155.3, %wide.trip.count156.3
  br i1 %exitcond157.3, label %.loopexit.loopexit, label %.lr.ph111.split

._crit_edge114.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge114

._crit_edge114.loopexit235:                       ; preds = %.loopexit
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit235, %._crit_edge114.loopexit, %.preheader, %.preheader.thread
  %186 = phi i32 [ %102, %.preheader.thread ], [ %122, %.preheader ], [ %122, %._crit_edge114.loopexit ], [ %122, %._crit_edge114.loopexit235 ]
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %187, i64 %187
  store double 1.000000e+00, double* %188, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge19
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
