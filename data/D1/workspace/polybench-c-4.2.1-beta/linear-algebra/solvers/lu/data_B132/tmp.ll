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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.lr.ph50:
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %._crit_edge46, %.lr.ph50
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge46 ], [ 0, %.lr.ph50 ]
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %._crit_edge46 ], [ 1, %.lr.ph50 ]
  br label %1

; <label>:1:                                      ; preds = %1, %.lr.ph40
  %indvars.iv91 = phi i64 [ 0, %.lr.ph40 ], [ %indvars.iv.next92, %1 ]
  %2 = sub nsw i64 0, %indvars.iv91
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 2000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.000000e+03
  %7 = fadd double %6, 1.000000e+00
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv91
  store double %7, double* %8, align 8
  %exitcond95 = icmp eq i64 %indvars.iv91, %indvars.iv101
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  br i1 %exitcond95, label %._crit_edge41, label %1

._crit_edge41:                                    ; preds = %1
  %sext = shl i64 %indvars.iv96, 32
  %9 = ashr exact i64 %sext, 32
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %10 = icmp slt i64 %indvars.iv.next102, 2000
  br i1 %10, label %._crit_edge41..lr.ph45_crit_edge, label %.lr.ph33.split.us.preheader

._crit_edge41..lr.ph45_crit_edge:                 ; preds = %._crit_edge41
  %11 = sub nsw i64 2000, %9
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph45.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge41..lr.ph45_crit_edge
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %9, %n.vec
  br i1 %cmp.zero, label %.lr.ph45.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = add nsw i64 %n.vec, -4
  %13 = lshr exact i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %xtraiter = and i64 %14, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %offset.idx.prol = add i64 %9, %index.prol
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %offset.idx.prol
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %12, 12
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %9, %index
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %offset.idx
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %9, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %offset.idx.1
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %offset.idx.2 = add i64 %9, %index.next.1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %offset.idx.2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.2 = add i64 %index, 12
  %offset.idx.3 = add i64 %9, %index.next.2
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %offset.idx.3
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next.3 = add i64 %index, 16
  %36 = icmp eq i64 %index.next.3, %n.vec
  br i1 %36, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge46, label %.lr.ph45.preheader

.lr.ph45.preheader:                               ; preds = %middle.block, %min.iters.checked, %._crit_edge41..lr.ph45_crit_edge
  %indvars.iv98.ph = phi i64 [ %9, %min.iters.checked ], [ %9, %._crit_edge41..lr.ph45_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader, %.lr.ph45
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %.lr.ph45 ], [ %indvars.iv98.ph, %.lr.ph45.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv98
  store double 0.000000e+00, double* %37, align 8
  %exitcond100 = icmp eq i64 %indvars.iv98, 1999
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  br i1 %exitcond100, label %._crit_edge46.loopexit, label %.lr.ph45, !llvm.loop !6

._crit_edge46.loopexit:                           ; preds = %.lr.ph45
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %middle.block
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv101
  store double 1.000000e+00, double* %38, align 8
  %indvars.iv.next97 = add nsw i64 %9, 1
  br label %.lr.ph40

.lr.ph33.split.us.preheader:                      ; preds = %._crit_edge41
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv101
  store double 1.000000e+00, double* %39, align 8
  %40 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33.split.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.lr.ph33.split.us.preheader ], [ %indvars.iv.next90.7, %._crit_edge29.us ]
  %41 = mul nuw nsw i64 %indvars.iv89, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %42 = mul nuw nsw i64 %indvars.iv.next90, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %43 = mul nuw nsw i64 %indvars.iv.next90.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %44 = mul nuw nsw i64 %indvars.iv.next90.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.3 = or i64 %indvars.iv89, 4
  %45 = mul nuw nsw i64 %indvars.iv.next90.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = or i64 %indvars.iv89, 5
  %46 = mul nuw nsw i64 %indvars.iv.next90.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.5 = or i64 %indvars.iv89, 6
  %47 = mul nuw nsw i64 %indvars.iv.next90.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.6 = or i64 %indvars.iv89, 7
  %48 = mul nuw nsw i64 %indvars.iv.next90.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.7 = add nsw i64 %indvars.iv89, 8
  %exitcond106.7 = icmp eq i64 %indvars.iv.next90.7, 2000
  br i1 %exitcond106.7, label %.lr.ph15.us.preheader, label %._crit_edge29.us

.lr.ph15.us.preheader:                            ; preds = %._crit_edge29.us
  %49 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.lr.ph15.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader, %._crit_edge16.us-lcssa.us.us
  %indvars.iv84 = phi i64 [ %51, %._crit_edge16.us-lcssa.us.us ], [ 0, %.lr.ph15.us.preheader ]
  %scevgep15 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv84
  %51 = add nuw nsw i64 %indvars.iv84, 1
  %scevgep17 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %51
  %52 = bitcast double* %scevgep17 to i8*
  %53 = bitcast double* %scevgep15 to i8*
  br label %.lr.ph12.us.us

._crit_edge16.us-lcssa.us.us:                     ; preds = %._crit_edge13.us.us
  %exitcond105 = icmp eq i64 %51, 2000
  br i1 %exitcond105, label %.lr.ph5.split.us.preheader, label %.lr.ph15.us

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge16.us-lcssa.us.us
  %54 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.lr.ph5.split.us

.lr.ph12.us.us:                                   ; preds = %._crit_edge13.us.us, %.lr.ph15.us
  %indvars.iv82 = phi i64 [ 0, %.lr.ph15.us ], [ %indvars.iv.next83, %._crit_edge13.us.us ]
  %56 = mul nuw nsw i64 %indvars.iv82, 16000
  %scevgep13 = getelementptr i8, i8* %40, i64 %56
  %57 = add nuw nsw i64 %56, 16000
  %scevgep14 = getelementptr i8, i8* %40, i64 %57
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv84
  %bound0 = icmp ult i8* %scevgep13, %52
  %bound1 = icmp ult i8* %53, %scevgep14
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %58 to i8*
  %bound020 = icmp ult i8* %scevgep13, %bc
  %bound121 = icmp ult i8* %bc, %scevgep14
  %found.conflict22 = and i1 %bound020, %bound121
  %conflict.rdx = or i1 %found.conflict, %found.conflict22
  br i1 %conflict.rdx, label %scalar.ph10.preheader, label %vector.body8.preheader

vector.body8.preheader:                           ; preds = %.lr.ph12.us.us
  br label %vector.body8

scalar.ph10.preheader:                            ; preds = %.lr.ph12.us.us
  br label %scalar.ph10

vector.body8:                                     ; preds = %vector.body8.preheader, %vector.body8
  %index24 = phi i64 [ %index.next25, %vector.body8 ], [ 0, %vector.body8.preheader ]
  %59 = or i64 %index24, 1
  %60 = or i64 %index24, 2
  %61 = or i64 %index24, 3
  %62 = load double, double* %58, align 8, !alias.scope !8
  %63 = insertelement <2 x double> undef, double %62, i32 0
  %64 = shufflevector <2 x double> %63, <2 x double> undef, <2 x i32> zeroinitializer
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index24, i64 %indvars.iv84
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %59, i64 %indvars.iv84
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %60, i64 %indvars.iv84
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %61, i64 %indvars.iv84
  %69 = load double, double* %65, align 8, !alias.scope !11
  %70 = load double, double* %66, align 8, !alias.scope !11
  %71 = load double, double* %67, align 8, !alias.scope !11
  %72 = load double, double* %68, align 8, !alias.scope !11
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %70, i32 1
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %72, i32 1
  %77 = fmul <2 x double> %64, %74
  %78 = fmul <2 x double> %64, %76
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv82, i64 %index24
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !13, !noalias !15
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !13, !noalias !15
  %83 = fadd <2 x double> %wide.load, %77
  %84 = fadd <2 x double> %wide.load32, %78
  store <2 x double> %83, <2 x double>* %80, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %84, <2 x double>* %82, align 8, !alias.scope !13, !noalias !15
  %index.next25 = add nuw nsw i64 %index24, 4
  %85 = icmp eq i64 %index.next25, 2000
  br i1 %85, label %._crit_edge13.us.us.loopexit63, label %vector.body8, !llvm.loop !16

._crit_edge13.us.us.loopexit:                     ; preds = %scalar.ph10
  br label %._crit_edge13.us.us

._crit_edge13.us.us.loopexit63:                   ; preds = %vector.body8
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.loopexit63, %._crit_edge13.us.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond104, label %._crit_edge16.us-lcssa.us.us, label %.lr.ph12.us.us

scalar.ph10:                                      ; preds = %scalar.ph10, %scalar.ph10.preheader
  %indvars.iv79 = phi i64 [ 0, %scalar.ph10.preheader ], [ %indvars.iv.next80.1, %scalar.ph10 ]
  %86 = load double, double* %58, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv84
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv82, i64 %indvars.iv79
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %93 = load double, double* %58, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next80, i64 %indvars.iv84
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next80
  %98 = load double, double* %97, align 8
  %99 = fadd double %98, %96
  store double %99, double* %97, align 8
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80, 1999
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond81.1, label %._crit_edge13.us.us.loopexit, label %scalar.ph10, !llvm.loop !17

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge3.us
  %indvars.iv77 = phi i64 [ %100, %._crit_edge3.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 0
  %scevgep3839 = bitcast double* %scevgep38 to i8*
  %100 = add nuw nsw i64 %indvars.iv77, 1
  %scevgep40 = getelementptr [2000 x double], [2000 x double]* %0, i64 %100, i64 0
  %scevgep4041 = bitcast double* %scevgep40 to i8*
  %101 = mul nuw nsw i64 %indvars.iv77, 16000
  %scevgep42 = getelementptr i8, i8* %40, i64 %101
  %102 = add nuw nsw i64 %101, 16000
  %scevgep43 = getelementptr i8, i8* %40, i64 %102
  %bound044 = icmp ult i8* %scevgep3839, %scevgep43
  %bound145 = icmp ult i8* %scevgep42, %scevgep4041
  %memcheck.conflict47 = and i1 %bound044, %bound145
  br i1 %memcheck.conflict47, label %scalar.ph35.preheader, label %vector.body33.preheader

vector.body33.preheader:                          ; preds = %.lr.ph5.split.us
  br label %vector.body33

scalar.ph35.preheader:                            ; preds = %.lr.ph5.split.us
  br label %scalar.ph35

vector.body33:                                    ; preds = %vector.body33, %vector.body33.preheader
  %index50 = phi i64 [ 0, %vector.body33.preheader ], [ %index.next51.1, %vector.body33 ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv77, i64 %index50
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load58 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !18
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load59 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !18
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %index50
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load58, <2 x i64>* %108, align 8, !alias.scope !21, !noalias !18
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load59, <2 x i64>* %110, align 8, !alias.scope !21, !noalias !18
  %index.next51 = or i64 %index50, 4
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv77, i64 %index.next51
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load58.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !18
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load59.1 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !18
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %index.next51
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load58.1, <2 x i64>* %116, align 8, !alias.scope !21, !noalias !18
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load59.1, <2 x i64>* %118, align 8, !alias.scope !21, !noalias !18
  %index.next51.1 = add nsw i64 %index50, 8
  %119 = icmp eq i64 %index.next51.1, 2000
  br i1 %119, label %._crit_edge3.us.loopexit62, label %vector.body33, !llvm.loop !23

scalar.ph35:                                      ; preds = %scalar.ph35, %scalar.ph35.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph35.preheader ], [ %indvars.iv.next.4, %scalar.ph35 ]
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.next
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge3.us.loopexit, label %scalar.ph35, !llvm.loop !24

._crit_edge3.us.loopexit:                         ; preds = %scalar.ph35
  br label %._crit_edge3.us

._crit_edge3.us.loopexit62:                       ; preds = %vector.body33
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit62, %._crit_edge3.us.loopexit
  %exitcond103 = icmp eq i64 %100, 2000
  br i1 %exitcond103, label %145, label %.lr.ph5.split.us

; <label>:145:                                    ; preds = %._crit_edge3.us
  call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.lr.ph21:
  %1 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %2

; <label>:2:                                      ; preds = %._crit_edge15, %.lr.ph21
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge15 ], [ 0, %.lr.ph21 ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge15 ], [ 4294967295, %.lr.ph21 ]
  %3 = phi [2000 x double]* [ %62, %._crit_edge15 ], [ %0, %.lr.ph21 ]
  %4 = and i64 %indvars.iv59, 4294967295
  %5 = icmp sgt i64 %indvars.iv3, 0
  br i1 %5, label %.lr.ph3.preheader, label %._crit_edge15

.lr.ph3.preheader:                                ; preds = %2
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %.lr.ph3.preheader, %._crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 4294967295, %.lr.ph3.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %6 = phi [2000 x double]* [ %32, %._crit_edge ], [ %3, %.lr.ph3.preheader ]
  %7 = and i64 %indvars.iv56, 4294967295
  %8 = icmp sgt i64 %indvars.iv41, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv3, i64 %indvars.iv41
  %.pre = load double, double* %9, align 8
  %10 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv3, i64 0
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 0, i64 %indvars.iv41
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre, %15
  store double %16, double* %9, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %16, %.prol.preheader ], [ %.pre, %.lr.ph ]
  %17 = icmp eq i64 %7, 0
  br i1 %17, label %.._crit_edge_crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %18

; <label>:18:                                     ; preds = %18, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %18 ]
  %19 = phi double [ %.unr.ph, %.lr.ph.new ], [ %31, %18 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv3, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv, i64 %indvars.iv41
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv3, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv.next, i64 %indvars.iv41
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %9, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next, %7
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond58.1, label %.._crit_edge_crit_edge.unr-lcssa, label %18

.._crit_edge_crit_edge.unr-lcssa:                 ; preds = %18
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.prol.loopexit.unr-lcssa, %.._crit_edge_crit_edge.unr-lcssa
  %.pre31 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph3, %.._crit_edge_crit_edge
  %32 = phi [2000 x double]* [ %.pre31, %.._crit_edge_crit_edge ], [ %6, %.lr.ph3 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv41, i64 %indvars.iv41
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv3, i64 %indvars.iv41
  %36 = load double, double* %35, align 8
  %37 = fdiv double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %indvars.iv.next57 = add nuw nsw i64 %7, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next42, %indvars.iv3
  br i1 %exitcond5, label %.lr.ph14..lr.ph14.split.us_crit_edge, label %.lr.ph3

.lr.ph14..lr.ph14.split.us_crit_edge:             ; preds = %._crit_edge
  %38 = load [2000 x double]*, [2000 x double]** %1, align 8
  %39 = and i64 %indvars.iv59, 1
  %lcmp.mod10 = icmp eq i64 %39, 0
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv3, i64 0
  %41 = icmp eq i64 %4, 0
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph14..lr.ph14.split.us_crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge10.us ], [ %indvars.iv3, %.lr.ph14..lr.ph14.split.us_crit_edge ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv3, i64 %indvars.iv52
  %.pre32 = load double, double* %42, align 8
  br i1 %lcmp.mod10, label %.prol.preheader7, label %.prol.loopexit8.unr-lcssa

.prol.preheader7:                                 ; preds = %.lr.ph14.split.us
  %43 = load double, double* %40, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 0, i64 %indvars.iv52
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %.pre32, %46
  store double %47, double* %42, align 8
  br label %.prol.loopexit8.unr-lcssa

.prol.loopexit8.unr-lcssa:                        ; preds = %.lr.ph14.split.us, %.prol.preheader7
  %indvars.iv44.unr.ph = phi i64 [ 1, %.prol.preheader7 ], [ 0, %.lr.ph14.split.us ]
  %.unr11.ph = phi double [ %47, %.prol.preheader7 ], [ %.pre32, %.lr.ph14.split.us ]
  br i1 %41, label %._crit_edge10.us, label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.prol.loopexit8.unr-lcssa
  br label %48

; <label>:48:                                     ; preds = %48, %.lr.ph14.split.us.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr.ph, %.lr.ph14.split.us.new ], [ %indvars.iv.next45.1, %48 ]
  %49 = phi double [ %.unr11.ph, %.lr.ph14.split.us.new ], [ %61, %48 ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv3, i64 %indvars.iv44
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv44, i64 %indvars.iv52
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %42, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv3, i64 %indvars.iv.next45
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %indvars.iv.next45, i64 %indvars.iv52
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %55, %60
  store double %61, double* %42, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next45, %4
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  br i1 %exitcond.1, label %._crit_edge10.us.unr-lcssa, label %48

._crit_edge10.us.unr-lcssa:                       ; preds = %48
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit8.unr-lcssa, %._crit_edge10.us.unr-lcssa
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond61, label %._crit_edge15.loopexit, label %.lr.ph14.split.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %62 = phi [2000 x double]* [ %3, %2 ], [ %38, %._crit_edge15.loopexit ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %indvars.iv.next60 = add nuw nsw i64 %4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond6, label %63, label %2

; <label>:63:                                     ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph5.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2.us, label %6

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %17, label %.lr.ph5.split.us

; <label>:17:                                     ; preds = %._crit_edge2.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !4, !5}
