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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  store i8* %11, i8** %7, align 8
  %12 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %13 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %15 = bitcast [1200 x double]** %9 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %17 = bitcast [1200 x double]** %10 to i8**
  store i8* %16, i8** %17, align 8
  %18 = bitcast i8* %11 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %6, [1200 x double]* %18)
  call void (...) @polybench_timer_start() #4
  %19 = load double, double* %6, align 8
  %20 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %8, align 8
  %21 = bitcast [1200 x [1200 x double]]* %20 to [1200 x double]*
  %22 = load [1200 x double]*, [1200 x double]** %9, align 8
  %23 = bitcast [1200 x double]* %22 to double*
  %24 = load [1200 x double]*, [1200 x double]** %10, align 8
  %25 = bitcast [1200 x double]* %24 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %19, [1200 x double]* %18, [1200 x double]* %21, double* %23, double* %25)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %26 = load i32, i32* %3, align 4
  %27 = icmp sgt i32 %26, 42
  br i1 %27, label %28, label %._crit_edge

; <label>:28:                                     ; preds = %2
  %29 = load i8**, i8*** %4, align 8
  %30 = load i8*, i8** %29, align 8
  %strcmpload = load i8, i8* %30, align 1
  %31 = icmp eq i8 %strcmpload, 0
  br i1 %31, label %32, label %._crit_edge

; <label>:32:                                     ; preds = %28
  %33 = bitcast [1200 x [1200 x double]]* %20 to [1200 x double]*
  %34 = load i32, i32* %5, align 4
  call fastcc void @print_array(i32 %34, [1200 x double]* %33)
  br label %._crit_edge

._crit_edge:                                      ; preds = %28, %2, %32
  %35 = bitcast [1200 x double]* %24 to i8*
  %36 = bitcast [1200 x double]* %22 to i8*
  %37 = bitcast [1200 x [1200 x double]]* %20 to i8*
  %38 = load i8*, i8** %7, align 8
  call void @free(i8* %38) #4
  call void @free(i8* %37) #4
  call void @free(i8* %36) #4
  call void @free(i8* %35) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %22 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond7, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph64, label %._crit_edge9

.lr.ph64:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %11 = fdiv double 0.000000e+00, %2
  %12 = icmp sgt i64 %10, 1
  %smax158 = select i1 %12, i64 %10, i64 1
  %min.iters.check = icmp ult i64 %smax158, 4
  br i1 %min.iters.check, label %.lr.ph64.split.preheader164, label %min.iters.checked

.lr.ph64.split.preheader164:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph64.split.preheader
  %indvars.iv137.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph64.split.preheader ], [ %n.vec, %middle.block ]
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
  %xtraiter173 = and i64 %15, 7
  %lcmp.mod174 = icmp eq i64 %xtraiter173, 0
  br i1 %lcmp.mod174, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter175 = phi i64 [ %xtraiter173, %vector.body.prol.preheader ], [ %prol.iter175.sub, %vector.body.prol ]
  %16 = getelementptr inbounds double, double* %5, i64 %index.prol
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %broadcast.splat161, <2 x double>* %19, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter175.sub = add i64 %prol.iter175, -1
  %prol.iter175.cmp = icmp eq i64 %prol.iter175.sub, 0
  br i1 %prol.iter175.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
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
  br i1 %53, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %smax158, %n.vec
  br i1 %cmp.n, label %.lr.ph53, label %.lr.ph64.split.preheader164

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %54 = zext i32 %1 to i64
  %55 = add nsw i64 %54, -1
  %xtraiter147 = and i64 %54, 3
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge60.us
  %indvars.iv133 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next134, %._crit_edge60.us ]
  %56 = icmp eq i64 %xtraiter147, 0
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv133
  store double 0.000000e+00, double* %57, align 8
  br i1 %56, label %.prol.loopexit146, label %.prol.preheader145.preheader

.prol.preheader145.preheader:                     ; preds = %.lr.ph64.split.us
  br label %.prol.preheader145

.prol.preheader145:                               ; preds = %.prol.preheader145.preheader, %.prol.preheader145
  %58 = phi double [ %61, %.prol.preheader145 ], [ 0.000000e+00, %.prol.preheader145.preheader ]
  %indvars.iv129.prol = phi i64 [ %indvars.iv.next130.prol, %.prol.preheader145 ], [ 0, %.prol.preheader145.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader145 ], [ %xtraiter147, %.prol.preheader145.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv129.prol, i64 %indvars.iv133
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr179 = mul i64 %indvars.iv133, 8
  %sunkaddr180 = add i64 %sunkaddr, %sunkaddr179
  %sunkaddr181 = inttoptr i64 %sunkaddr180 to double*
  store double %61, double* %sunkaddr181, align 8
  %indvars.iv.next130.prol = add nuw nsw i64 %indvars.iv129.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit146.loopexit, label %.prol.preheader145, !llvm.loop !6

.prol.loopexit146.loopexit:                       ; preds = %.prol.preheader145
  br label %.prol.loopexit146

.prol.loopexit146:                                ; preds = %.prol.loopexit146.loopexit, %.lr.ph64.split.us
  %62 = phi double [ 0.000000e+00, %.lr.ph64.split.us ], [ %61, %.prol.loopexit146.loopexit ]
  %indvars.iv129.unr = phi i64 [ 0, %.lr.ph64.split.us ], [ %indvars.iv.next130.prol, %.prol.loopexit146.loopexit ]
  %63 = icmp ult i64 %55, 3
  br i1 %63, label %._crit_edge60.us, label %.lr.ph64.split.us.new.preheader

.lr.ph64.split.us.new.preheader:                  ; preds = %.prol.loopexit146
  br label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.lr.ph64.split.us.new.preheader, %.lr.ph64.split.us.new
  %64 = phi double [ %76, %.lr.ph64.split.us.new ], [ %62, %.lr.ph64.split.us.new.preheader ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.3, %.lr.ph64.split.us.new ], [ %indvars.iv129.unr, %.lr.ph64.split.us.new.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv129, i64 %indvars.iv133
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  %sunkaddr182 = ptrtoint double* %5 to i64
  %sunkaddr183 = mul i64 %indvars.iv133, 8
  %sunkaddr184 = add i64 %sunkaddr182, %sunkaddr183
  %sunkaddr185 = inttoptr i64 %sunkaddr184 to double*
  store double %67, double* %sunkaddr185, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next130, i64 %indvars.iv133
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %sunkaddr185, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next130.1, i64 %indvars.iv133
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %sunkaddr185, align 8
  %indvars.iv.next130.2 = add nsw i64 %indvars.iv129, 3
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next130.2, i64 %indvars.iv133
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %sunkaddr185, align 8
  %indvars.iv.next130.3 = add nsw i64 %indvars.iv129, 4
  %exitcond132.3 = icmp eq i64 %indvars.iv.next130.3, %54
  br i1 %exitcond132.3, label %._crit_edge60.us.loopexit, label %.lr.ph64.split.us.new

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph64.split.us.new
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit146
  %77 = phi double [ %62, %.prol.loopexit146 ], [ %76, %._crit_edge60.us.loopexit ]
  %78 = fdiv double %77, %2
  %sunkaddr186 = ptrtoint double* %5 to i64
  %sunkaddr187 = mul i64 %indvars.iv133, 8
  %sunkaddr188 = add i64 %sunkaddr186, %sunkaddr187
  %sunkaddr189 = inttoptr i64 %sunkaddr188 to double*
  store double %78, double* %sunkaddr189, align 8
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %79 = icmp slt i64 %indvars.iv.next134, %10
  br i1 %79, label %.lr.ph64.split.us, label %.lr.ph53.loopexit

.lr.ph53.loopexit:                                ; preds = %._crit_edge60.us
  br label %.lr.ph53

.lr.ph53.loopexit226:                             ; preds = %.lr.ph64.split
  br label %.lr.ph53

.lr.ph53:                                         ; preds = %.lr.ph53.loopexit226, %.lr.ph53.loopexit, %middle.block
  %80 = icmp sgt i32 %1, 0
  br i1 %80, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %81 = fdiv double 0.000000e+00, %2
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %82 = sext i32 %1 to i64
  %xtraiter = and i64 %82, 1
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge10.us
  %indvars.iv123 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next124, %._crit_edge10.us ]
  %83 = icmp eq i64 %xtraiter, 0
  %84 = getelementptr inbounds double, double* %6, i64 %indvars.iv123
  store double 0.000000e+00, double* %84, align 8
  br i1 %83, label %.prol.loopexit171, label %85

; <label>:85:                                     ; preds = %.lr.ph53.split.us
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv123
  %87 = load double, double* %86, align 8
  %sunkaddr190 = ptrtoint double* %5 to i64
  %sunkaddr191 = mul i64 %indvars.iv123, 8
  %sunkaddr192 = add i64 %sunkaddr190, %sunkaddr191
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to double*
  %88 = load double, double* %sunkaddr193, align 8
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %90, 0.000000e+00
  %sunkaddr194 = ptrtoint double* %6 to i64
  %sunkaddr195 = mul i64 %indvars.iv123, 8
  %sunkaddr196 = add i64 %sunkaddr194, %sunkaddr195
  %sunkaddr197 = inttoptr i64 %sunkaddr196 to double*
  store double %91, double* %sunkaddr197, align 8
  br label %.prol.loopexit171

.prol.loopexit171:                                ; preds = %85, %.lr.ph53.split.us
  %.unr.ph = phi double [ %91, %85 ], [ 0.000000e+00, %.lr.ph53.split.us ]
  %indvars.iv120.unr.ph = phi i64 [ 1, %85 ], [ 0, %.lr.ph53.split.us ]
  %.lcssa167.unr.ph = phi double [ %91, %85 ], [ undef, %.lr.ph53.split.us ]
  %92 = icmp eq i32 %1, 1
  br i1 %92, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit171
  br label %96

; <label>:93:                                     ; preds = %._crit_edge50.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge50.us, %93
  %94 = phi double [ %112, %93 ], [ 1.000000e+00, %._crit_edge50.us ]
  %sunkaddr198 = ptrtoint double* %6 to i64
  %sunkaddr199 = mul i64 %indvars.iv123, 8
  %sunkaddr200 = add i64 %sunkaddr198, %sunkaddr199
  %sunkaddr201 = inttoptr i64 %sunkaddr200 to double*
  store double %94, double* %sunkaddr201, align 8
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %95 = icmp slt i64 %indvars.iv.next124, %10
  br i1 %95, label %.lr.ph53.split.us, label %._crit_edge9.loopexit

; <label>:96:                                     ; preds = %96, %.lr.ph53.split.us.new
  %97 = phi double [ %.unr.ph, %.lr.ph53.split.us.new ], [ %109, %96 ]
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next121.1, %96 ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv120, i64 %indvars.iv123
  %99 = load double, double* %98, align 8
  %sunkaddr202 = ptrtoint double* %5 to i64
  %sunkaddr203 = mul i64 %indvars.iv123, 8
  %sunkaddr204 = add i64 %sunkaddr202, %sunkaddr203
  %sunkaddr205 = inttoptr i64 %sunkaddr204 to double*
  %100 = load double, double* %sunkaddr205, align 8
  %101 = fsub double %99, %100
  %102 = fmul double %101, %101
  %103 = fadd double %102, %97
  %sunkaddr206 = ptrtoint double* %6 to i64
  %sunkaddr207 = mul i64 %indvars.iv123, 8
  %sunkaddr208 = add i64 %sunkaddr206, %sunkaddr207
  %sunkaddr209 = inttoptr i64 %sunkaddr208 to double*
  store double %103, double* %sunkaddr209, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next121, i64 %indvars.iv123
  %105 = load double, double* %104, align 8
  %106 = load double, double* %sunkaddr205, align 8
  %107 = fsub double %105, %106
  %108 = fmul double %107, %107
  %109 = fadd double %108, %103
  store double %109, double* %sunkaddr209, align 8
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %110 = icmp slt i64 %indvars.iv.next121.1, %82
  br i1 %110, label %96, label %._crit_edge50.us.loopexit

._crit_edge50.us.loopexit:                        ; preds = %96
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %._crit_edge50.us.loopexit, %.prol.loopexit171
  %.lcssa167 = phi double [ %.lcssa167.unr.ph, %.prol.loopexit171 ], [ %109, %._crit_edge50.us.loopexit ]
  %111 = fdiv double %.lcssa167, %2
  %sunkaddr210 = ptrtoint double* %6 to i64
  %sunkaddr211 = mul i64 %indvars.iv123, 8
  %sunkaddr212 = add i64 %sunkaddr210, %sunkaddr211
  %sunkaddr213 = inttoptr i64 %sunkaddr212 to double*
  store double %111, double* %sunkaddr213, align 8
  %112 = tail call double @sqrt(double %111) #4
  store double %112, double* %sunkaddr213, align 8
  %113 = fcmp ugt double %112, 1.000000e-01
  br i1 %113, label %93, label %._crit_edge10.us

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader164, %.lr.ph64.split
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %.lr.ph64.split ], [ %indvars.iv137.ph, %.lr.ph64.split.preheader164 ]
  %114 = getelementptr inbounds double, double* %5, i64 %indvars.iv137
  store double %11, double* %114, align 8
  %indvars.iv.next138 = add nsw i64 %indvars.iv137, 1
  %115 = icmp slt i64 %indvars.iv.next138, %10
  br i1 %115, label %.lr.ph64.split, label %.lr.ph53.loopexit226, !llvm.loop !7

._crit_edge9.loopexit:                            ; preds = %._crit_edge10.us
  br label %._crit_edge9

._crit_edge9.loopexit224:                         ; preds = %._crit_edge10
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit224, %._crit_edge9.loopexit, %7
  %116 = icmp sgt i32 %1, 0
  br i1 %116, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  %117 = icmp sgt i32 %0, 0
  br i1 %117, label %._crit_edge11.us.preheader, label %._crit_edge12

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %118 = sext i32 %0 to i64
  %119 = sext i32 %1 to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge43.us
  %indvars.iv118 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next119, %._crit_edge43.us ]
  br label %120

; <label>:120:                                    ; preds = %._crit_edge11.us, %120
  %indvars.iv116 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next117, %120 ]
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv116
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv116
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %122
  store double %125, double* %123, align 8
  %126 = tail call double @sqrt(double %2) #4
  %127 = getelementptr inbounds double, double* %6, i64 %indvars.iv116
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = load double, double* %123, align 8
  %131 = fdiv double %130, %129
  store double %131, double* %123, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %132 = icmp slt i64 %indvars.iv.next117, %118
  br i1 %132, label %120, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %120
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %133 = icmp slt i64 %indvars.iv.next119, %119
  br i1 %133, label %._crit_edge11.us, label %._crit_edge12.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader, %._crit_edge10
  %indvars.iv126 = phi i64 [ 0, %.lr.ph53.split.preheader ], [ %indvars.iv.next127, %._crit_edge10 ]
  %134 = getelementptr inbounds double, double* %6, i64 %indvars.iv126
  store double %81, double* %134, align 8
  %135 = tail call double @sqrt(double %81) #4
  store double %135, double* %134, align 8
  %136 = fcmp ugt double %135, 1.000000e-01
  br i1 %136, label %137, label %._crit_edge10

; <label>:137:                                    ; preds = %.lr.ph53.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph53.split, %137
  %138 = phi double [ %135, %137 ], [ 1.000000e+00, %.lr.ph53.split ]
  %sunkaddr214 = ptrtoint double* %6 to i64
  %sunkaddr215 = mul i64 %indvars.iv126, 8
  %sunkaddr216 = add i64 %sunkaddr214, %sunkaddr215
  %sunkaddr217 = inttoptr i64 %sunkaddr216 to double*
  store double %138, double* %sunkaddr217, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %139 = icmp slt i64 %indvars.iv.next127, %10
  br i1 %139, label %.lr.ph53.split, label %._crit_edge9.loopexit224

._crit_edge12.loopexit:                           ; preds = %._crit_edge43.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge11.lr.ph, %._crit_edge9
  %140 = icmp sgt i32 %0, 1
  br i1 %140, label %.lr.ph23, label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12
  %.pre = add nsw i32 %0, -1
  br label %195

.lr.ph23:                                         ; preds = %._crit_edge12
  %141 = icmp sgt i32 %1, 0
  %142 = add nsw i32 %0, -1
  %143 = add i32 %0, -2
  br i1 %141, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %144 = sext i32 %142 to i64
  %145 = sext i32 %0 to i64
  %146 = add i32 %0, 1
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %147 = sext i32 %0 to i64
  %148 = sext i32 %142 to i64
  %149 = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv97 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next98, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv87 = phi i64 [ 1, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next88, %._crit_edge19.us-lcssa.us.us ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %indvars.iv97
  store double 1.000000e+00, double* %150, align 8
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, 1
  %151 = icmp slt i64 %indvars.iv.next98, %147
  br i1 %151, label %.lr.ph.us.us.preheader, label %._crit_edge19.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge14.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %152 = icmp slt i64 %indvars.iv.next98, %148
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  br i1 %152, label %.lr.ph23.split.us, label %.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge14.us.us ], [ %indvars.iv87, %.lr.ph.us.us.preheader ]
  %153 = icmp eq i32 %149, 0
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %indvars.iv89
  store double 0.000000e+00, double* %154, align 8
  br i1 %153, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %sunkaddr218 = ptrtoint [1200 x double]* %3 to i64
  %sunkaddr219 = mul i64 %indvars.iv97, 8
  %sunkaddr220 = add i64 %sunkaddr218, %sunkaddr219
  %sunkaddr221 = inttoptr i64 %sunkaddr220 to double*
  %155 = load double, double* %sunkaddr221, align 8
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
  %163 = icmp eq i32 %1, 1
  br i1 %163, label %._crit_edge14.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %164 = bitcast double %180 to i64
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit
  %165 = phi i64 [ %161, %.prol.loopexit ], [ %164, %._crit_edge14.us.us.loopexit ]
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89, i64 %indvars.iv97
  %167 = bitcast double* %166 to i64*
  store i64 %165, i64* %167, align 8
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next90 to i32
  %exitcond95 = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond95, label %._crit_edge19.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %168 = phi double [ %180, %.lr.ph.us.us.new ], [ %162, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv97
  %170 = load double, double* %169, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv89
  %172 = load double, double* %171, align 8
  %173 = fmul double %170, %172
  %174 = fadd double %173, %168
  store double %174, double* %154, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv97
  %176 = load double, double* %175, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv89
  %178 = load double, double* %177, align 8
  %179 = fmul double %176, %178
  %180 = fadd double %179, %174
  store double %180, double* %154, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge14.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %._crit_edge19
  %indvar = phi i32 [ 0, %.lr.ph23.split.preheader ], [ %indvar.next, %._crit_edge19 ]
  %indvars.iv112 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next113, %._crit_edge19 ]
  %indvars.iv101 = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv.next102, %._crit_edge19 ]
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv112, i64 %indvars.iv112
  store double 1.000000e+00, double* %181, align 8
  %indvars.iv.next113 = add nsw i64 %indvars.iv112, 1
  %182 = icmp slt i64 %indvars.iv.next113, %145
  br i1 %182, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph23.split
  %183 = sub i32 %146, %indvar
  %xtraiter143 = and i32 %183, 1
  %lcmp.mod144 = icmp eq i32 %xtraiter143, 0
  br i1 %lcmp.mod144, label %.prol.loopexit142, label %.prol.preheader141

.prol.preheader141:                               ; preds = %.lr.ph18
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv112, i64 %indvars.iv101
  store double 0.000000e+00, double* %184, align 8
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv101, i64 %indvars.iv112
  %186 = bitcast double* %185 to i64*
  store i64 0, i64* %186, align 8
  %indvars.iv.next104.prol = add nsw i64 %indvars.iv101, 1
  br label %.prol.loopexit142

.prol.loopexit142:                                ; preds = %.prol.preheader141, %.lr.ph18
  %indvars.iv103.unr.ph = phi i64 [ %indvars.iv.next104.prol, %.prol.preheader141 ], [ %indvars.iv101, %.lr.ph18 ]
  %187 = icmp eq i32 %143, %indvar
  br i1 %187, label %._crit_edge19, label %.lr.ph18.new.preheader

.lr.ph18.new.preheader:                           ; preds = %.prol.loopexit142
  br label %.lr.ph18.new

.lr.ph18.new:                                     ; preds = %.lr.ph18.new.preheader, %.lr.ph18.new
  %indvars.iv103 = phi i64 [ %indvars.iv.next104.1, %.lr.ph18.new ], [ %indvars.iv103.unr.ph, %.lr.ph18.new.preheader ]
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv112, i64 %indvars.iv103
  store double 0.000000e+00, double* %188, align 8
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv112
  %190 = bitcast double* %189 to i64*
  store i64 0, i64* %190, align 8
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, 1
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv112, i64 %indvars.iv.next104
  store double 0.000000e+00, double* %191, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104, i64 %indvars.iv112
  %193 = bitcast double* %192 to i64*
  store i64 0, i64* %193, align 8
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103, 2
  %lftr.wideiv109.1 = trunc i64 %indvars.iv.next104.1 to i32
  %exitcond110.1 = icmp eq i32 %lftr.wideiv109.1, %0
  br i1 %exitcond110.1, label %._crit_edge19.loopexit, label %.lr.ph18.new

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.new
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.prol.loopexit142, %.lr.ph23.split
  %194 = icmp slt i64 %indvars.iv.next113, %144
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %194, label %.lr.ph23.split, label %.loopexit222

.loopexit:                                        ; preds = %._crit_edge19.us-lcssa.us.us
  br label %195

.loopexit222:                                     ; preds = %._crit_edge19
  br label %195

; <label>:195:                                    ; preds = %.loopexit222, %.loopexit, %._crit_edge12._crit_edge
  %.pre-phi = phi i32 [ %.pre, %._crit_edge12._crit_edge ], [ %142, %.loopexit ], [ %142, %.loopexit222 ]
  %196 = sext i32 %.pre-phi to i64
  %197 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %196, i64 %196
  store double 1.000000e+00, double* %197, align 8
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
  br i1 %7, label %._crit_edge.us.preheader, label %22

._crit_edge.us.preheader:                         ; preds = %2
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
  br i1 %21, label %._crit_edge.us, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge3.us
  br label %22

; <label>:22:                                     ; preds = %.loopexit, %2
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
