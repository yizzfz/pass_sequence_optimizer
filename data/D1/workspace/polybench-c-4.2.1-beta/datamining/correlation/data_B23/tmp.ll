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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %5, double** %11, align 8
  store double* %6, double** %12, align 8
  store double 1.000000e-01, double* %13, align 8
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph64, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %7
  br label %._crit_edge9

.lr.ph64:                                         ; preds = %7
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph64.split.us.preheader, label %.lr.ph64.split.preheader

.lr.ph64.split.us.preheader:                      ; preds = %.lr.ph64
  %16 = and i32 %1, 1
  %lcmp.mod163 = icmp eq i32 %16, 0
  %17 = icmp eq i32 %1, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %wide.trip.count149.1 = zext i32 %1 to i64
  %18 = sext i32 %0 to i64
  %19 = add nsw i64 %wide.trip.count149.1, -2
  br label %.lr.ph64.split.us

.lr.ph64.split.preheader:                         ; preds = %.lr.ph64
  %20 = sext i32 %0 to i64
  %21 = fdiv double 0.000000e+00, %2
  %22 = icmp sgt i64 %20, 1
  %smax190 = select i1 %22, i64 %20, i64 1
  %min.iters.check = icmp ult i64 %smax190, 4
  br i1 %min.iters.check, label %.lr.ph64.split.preheader196, label %min.iters.checked

.lr.ph64.split.preheader196:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph64.split.preheader
  %indvars.iv152.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph64.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph64.split

min.iters.checked:                                ; preds = %.lr.ph64.split.preheader
  %n.vec = and i64 %smax190, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph64.split.preheader196, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert192 = insertelement <2 x double> undef, double %21, i32 0
  %broadcast.splat193 = shufflevector <2 x double> %broadcast.splatinsert192, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = add nsw i64 %n.vec, -4
  %24 = lshr exact i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %xtraiter207 = and i64 %25, 7
  %lcmp.mod208 = icmp eq i64 %xtraiter207, 0
  br i1 %lcmp.mod208, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter207, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %26 = getelementptr inbounds double, double* %5, i64 %index.prol
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %29, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %30 = icmp ult i64 %23, 28
  br i1 %30, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %31 = getelementptr inbounds double, double* %5, i64 %index
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %34, align 8
  %index.next = add i64 %index, 4
  %35 = getelementptr inbounds double, double* %5, i64 %index.next
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %38, align 8
  %index.next.1 = add i64 %index, 8
  %39 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %42, align 8
  %index.next.2 = add i64 %index, 12
  %43 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %46, align 8
  %index.next.3 = add i64 %index, 16
  %47 = getelementptr inbounds double, double* %5, i64 %index.next.3
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %50, align 8
  %index.next.4 = add i64 %index, 20
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.4
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %54, align 8
  %index.next.5 = add i64 %index, 24
  %55 = getelementptr inbounds double, double* %5, i64 %index.next.5
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %58, align 8
  %index.next.6 = add i64 %index, 28
  %59 = getelementptr inbounds double, double* %5, i64 %index.next.6
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %60, align 8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> %broadcast.splat193, <2 x double>* %62, align 8
  %index.next.7 = add i64 %index, 32
  %63 = icmp eq i64 %index.next.7, %n.vec
  br i1 %63, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax190, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph64.split.preheader196

.lr.ph64.split.us:                                ; preds = %.lr.ph64.split.us.preheader, %._crit_edge60.us
  %indvars.iv187 = phi i64 [ 0, %.lr.ph64.split.us.preheader ], [ %indvars.iv.next188, %._crit_edge60.us ]
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv187
  store double 0.000000e+00, double* %64, align 8
  br i1 %lcmp.mod163, label %.prol.loopexit161, label %.prol.preheader160

.prol.preheader160:                               ; preds = %.lr.ph64.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv187
  %66 = load double, double* %65, align 8
  %sunkaddr87.prol = shl nsw i64 %indvars.iv187, 3
  %sunkaddr88.prol = add i64 %sunkaddr, %sunkaddr87.prol
  %sunkaddr89.prol = inttoptr i64 %sunkaddr88.prol to double*
  %67 = load double, double* %sunkaddr89.prol, align 8
  %68 = fadd double %66, %67
  store double %68, double* %sunkaddr89.prol, align 8
  br label %.prol.loopexit161

.prol.loopexit161:                                ; preds = %.prol.preheader160, %.lr.ph64.split.us
  %indvars.iv147.unr.ph = phi i64 [ 1, %.prol.preheader160 ], [ 0, %.lr.ph64.split.us ]
  br i1 %17, label %._crit_edge60.us, label %.lr.ph64.split.us.new.preheader

.lr.ph64.split.us.new.preheader:                  ; preds = %.prol.loopexit161
  %sunkaddr87 = shl nsw i64 %indvars.iv187, 3
  %sunkaddr88 = add i64 %sunkaddr, %sunkaddr87
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to double*
  %.pre = load double, double* %sunkaddr89, align 8
  %69 = sub nsw i64 %19, %indvars.iv147.unr.ph
  %70 = lshr i64 %69, 1
  %71 = and i64 %70, 1
  %lcmp.mod203 = icmp eq i64 %71, 0
  br i1 %lcmp.mod203, label %.lr.ph64.split.us.new.prol.preheader, label %.lr.ph64.split.us.new.prol.loopexit.unr-lcssa

.lr.ph64.split.us.new.prol.preheader:             ; preds = %.lr.ph64.split.us.new.preheader
  br label %.lr.ph64.split.us.new.prol

.lr.ph64.split.us.new.prol:                       ; preds = %.lr.ph64.split.us.new.prol.preheader
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv147.unr.ph, i64 %indvars.iv187
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %.pre
  store double %74, double* %sunkaddr89, align 8
  %indvars.iv.next148.prol = add nuw nsw i64 %indvars.iv147.unr.ph, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next148.prol, i64 %indvars.iv187
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %sunkaddr89, align 8
  %indvars.iv.next148.1.prol = or i64 %indvars.iv147.unr.ph, 2
  br label %.lr.ph64.split.us.new.prol.loopexit.unr-lcssa

.lr.ph64.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.lr.ph64.split.us.new.preheader, %.lr.ph64.split.us.new.prol
  %.unr204.ph = phi double [ %77, %.lr.ph64.split.us.new.prol ], [ %.pre, %.lr.ph64.split.us.new.preheader ]
  %indvars.iv147.unr.ph205 = phi i64 [ %indvars.iv.next148.1.prol, %.lr.ph64.split.us.new.prol ], [ %indvars.iv147.unr.ph, %.lr.ph64.split.us.new.preheader ]
  br label %.lr.ph64.split.us.new.prol.loopexit

.lr.ph64.split.us.new.prol.loopexit:              ; preds = %.lr.ph64.split.us.new.prol.loopexit.unr-lcssa
  %78 = icmp eq i64 %70, 0
  br i1 %78, label %._crit_edge60.us.loopexit, label %.lr.ph64.split.us.new.preheader.new

.lr.ph64.split.us.new.preheader.new:              ; preds = %.lr.ph64.split.us.new.prol.loopexit
  br label %.lr.ph64.split.us.new

.lr.ph64.split.us.new:                            ; preds = %.lr.ph64.split.us.new, %.lr.ph64.split.us.new.preheader.new
  %79 = phi double [ %.unr204.ph, %.lr.ph64.split.us.new.preheader.new ], [ %91, %.lr.ph64.split.us.new ]
  %indvars.iv147 = phi i64 [ %indvars.iv147.unr.ph205, %.lr.ph64.split.us.new.preheader.new ], [ %indvars.iv.next148.1.1, %.lr.ph64.split.us.new ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv147, i64 %indvars.iv187
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  store double %82, double* %sunkaddr89, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next148, i64 %indvars.iv187
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %sunkaddr89, align 8
  %indvars.iv.next148.1 = add nuw nsw i64 %indvars.iv147, 2
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next148.1, i64 %indvars.iv187
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %sunkaddr89, align 8
  %indvars.iv.next148.1206 = add nsw i64 %indvars.iv147, 3
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next148.1206, i64 %indvars.iv187
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %sunkaddr89, align 8
  %indvars.iv.next148.1.1 = add nsw i64 %indvars.iv147, 4
  %exitcond150.1.1 = icmp eq i64 %indvars.iv.next148.1.1, %wide.trip.count149.1
  br i1 %exitcond150.1.1, label %._crit_edge60.us.loopexit.unr-lcssa, label %.lr.ph64.split.us.new

._crit_edge60.us.loopexit.unr-lcssa:              ; preds = %.lr.ph64.split.us.new
  br label %._crit_edge60.us.loopexit

._crit_edge60.us.loopexit:                        ; preds = %.lr.ph64.split.us.new.prol.loopexit, %._crit_edge60.us.loopexit.unr-lcssa
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us.loopexit, %.prol.loopexit161
  %92 = load double, double* %64, align 8
  %93 = fdiv double %92, %2
  store double %93, double* %64, align 8
  %indvars.iv.next188 = add nsw i64 %indvars.iv187, 1
  %94 = icmp slt i64 %indvars.iv.next188, %18
  br i1 %94, label %.lr.ph64.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge60.us
  br label %._crit_edge

._crit_edge.loopexit197:                          ; preds = %.lr.ph64.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit197, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph53, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph53:                                         ; preds = %._crit_edge
  %95 = load double*, double** %12, align 8
  %96 = load double, double* %8, align 8
  %97 = load double, double* %13, align 8
  %98 = load [1200 x double]*, [1200 x double]** %9, align 8
  %99 = ptrtoint double* %95 to i64
  br i1 %15, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %100 = sext i32 %0 to i64
  %101 = fdiv double 0.000000e+00, %96
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %102 = bitcast double** %11 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = sext i32 %1 to i64
  %105 = sext i32 %0 to i64
  %xtraiter = and i64 %104, 1
  %lcmp.mod201 = icmp eq i64 %xtraiter, 0
  %106 = icmp eq i32 %1, 1
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %116
  %indvars.iv183 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next184, %116 ]
  %107 = getelementptr inbounds double, double* %95, i64 %indvars.iv183
  store double 0.000000e+00, double* %107, align 8
  %sunkaddr91 = shl nsw i64 %indvars.iv183, 3
  %sunkaddr92 = add i64 %103, %sunkaddr91
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  %sunkaddr100 = add i64 %99, %sunkaddr91
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  %.pre194 = load double, double* %sunkaddr101, align 8
  br i1 %lcmp.mod201, label %.prol.loopexit200.unr-lcssa, label %.prol.preheader199

.prol.preheader199:                               ; preds = %.lr.ph53.split.us
  br label %108

; <label>:108:                                    ; preds = %.prol.preheader199
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %98, i64 0, i64 %indvars.iv183
  %110 = load double, double* %109, align 8
  %111 = load double, double* %sunkaddr93, align 8
  %112 = fsub double %110, %111
  %113 = fmul double %112, %112
  %114 = fadd double %113, %.pre194
  store double %114, double* %sunkaddr101, align 8
  br label %.prol.loopexit200.unr-lcssa

.prol.loopexit200.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %108
  %.unr.ph = phi double [ %114, %108 ], [ %.pre194, %.lr.ph53.split.us ]
  %indvars.iv140.unr.ph = phi i64 [ 1, %108 ], [ 0, %.lr.ph53.split.us ]
  br label %.prol.loopexit200

.prol.loopexit200:                                ; preds = %.prol.loopexit200.unr-lcssa
  br i1 %106, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit200
  br label %119

; <label>:115:                                    ; preds = %._crit_edge50.us
  br label %116

; <label>:116:                                    ; preds = %115, %._crit_edge50.us
  %117 = phi double [ %136, %115 ], [ 1.000000e+00, %._crit_edge50.us ]
  store double %117, double* %107, align 8
  %indvars.iv.next184 = add nsw i64 %indvars.iv183, 1
  %118 = icmp slt i64 %indvars.iv.next184, %105
  br i1 %118, label %.lr.ph53.split.us, label %.._crit_edge9_crit_edge.loopexit

; <label>:119:                                    ; preds = %119, %.lr.ph53.split.us.new
  %120 = phi double [ %.unr.ph, %.lr.ph53.split.us.new ], [ %132, %119 ]
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next141.1, %119 ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %98, i64 %indvars.iv140, i64 %indvars.iv183
  %122 = load double, double* %121, align 8
  %123 = load double, double* %sunkaddr93, align 8
  %124 = fsub double %122, %123
  %125 = fmul double %124, %124
  %126 = fadd double %125, %120
  store double %126, double* %sunkaddr101, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %98, i64 %indvars.iv.next141, i64 %indvars.iv183
  %128 = load double, double* %127, align 8
  %129 = load double, double* %sunkaddr93, align 8
  %130 = fsub double %128, %129
  %131 = fmul double %130, %130
  %132 = fadd double %131, %126
  store double %132, double* %sunkaddr101, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %133 = icmp slt i64 %indvars.iv.next141.1, %104
  br i1 %133, label %119, label %._crit_edge50.us.unr-lcssa

._crit_edge50.us.unr-lcssa:                       ; preds = %119
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %.prol.loopexit200, %._crit_edge50.us.unr-lcssa
  %134 = load double, double* %107, align 8
  %135 = fdiv double %134, %96
  store double %135, double* %107, align 8
  %136 = tail call double @sqrt(double %135) #4
  store double %136, double* %107, align 8
  %137 = fcmp ugt double %136, %97
  br i1 %137, label %115, label %116

.lr.ph64.split:                                   ; preds = %.lr.ph64.split.preheader196, %.lr.ph64.split
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %.lr.ph64.split ], [ %indvars.iv152.ph, %.lr.ph64.split.preheader196 ]
  %138 = getelementptr inbounds double, double* %5, i64 %indvars.iv152
  store double %21, double* %138, align 8
  %indvars.iv.next153 = add nsw i64 %indvars.iv152, 1
  %139 = icmp slt i64 %indvars.iv.next153, %20
  br i1 %139, label %.lr.ph64.split, label %._crit_edge.loopexit197, !llvm.loop !6

.._crit_edge9_crit_edge.loopexit:                 ; preds = %116
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge.loopexit195:              ; preds = %165
  br label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %.._crit_edge9_crit_edge.loopexit195, %.._crit_edge9_crit_edge.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.._crit_edge9_crit_edge, %._crit_edge.thread, %.._crit_edge9_crit_edge
  %140 = icmp sgt i32 %1, 0
  br i1 %140, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9
  %141 = load double*, double** %11, align 8
  %142 = load [1200 x double]*, [1200 x double]** %9, align 8
  %143 = load double, double* %8, align 8
  %144 = load double*, double** %12, align 8
  br i1 %14, label %._crit_edge11.us.preheader, label %.._crit_edge12_crit_edge.loopexit103

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %145 = sext i32 %0 to i64
  %146 = sext i32 %1 to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge43.us
  %indvars.iv179 = phi i64 [ 0, %._crit_edge11.us.preheader ], [ %indvars.iv.next180, %._crit_edge43.us ]
  br label %147

; <label>:147:                                    ; preds = %._crit_edge11.us, %147
  %indvars.iv138 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next139, %147 ]
  %148 = getelementptr inbounds double, double* %141, i64 %indvars.iv138
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %142, i64 %indvars.iv179, i64 %indvars.iv138
  %151 = load double, double* %150, align 8
  %152 = fsub double %151, %149
  store double %152, double* %150, align 8
  %153 = tail call double @sqrt(double %143) #4
  %154 = getelementptr inbounds double, double* %144, i64 %indvars.iv138
  %155 = load double, double* %154, align 8
  %156 = fmul double %153, %155
  %157 = load double, double* %150, align 8
  %158 = fdiv double %157, %156
  store double %158, double* %150, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %159 = icmp slt i64 %indvars.iv.next139, %145
  br i1 %159, label %147, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %147
  %indvars.iv.next180 = add nsw i64 %indvars.iv179, 1
  %160 = icmp slt i64 %indvars.iv.next180, %146
  br i1 %160, label %._crit_edge11.us, label %.._crit_edge12_crit_edge.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader, %165
  %indvars.iv144 = phi i64 [ 0, %.lr.ph53.split.preheader ], [ %indvars.iv.next145, %165 ]
  %161 = getelementptr inbounds double, double* %95, i64 %indvars.iv144
  store double %101, double* %161, align 8
  %162 = tail call double @sqrt(double %101) #4
  store double %162, double* %161, align 8
  %163 = fcmp ugt double %162, %97
  br i1 %163, label %164, label %165

; <label>:164:                                    ; preds = %.lr.ph53.split
  br label %165

; <label>:165:                                    ; preds = %.lr.ph53.split, %164
  %166 = phi double [ %162, %164 ], [ 1.000000e+00, %.lr.ph53.split ]
  store double %166, double* %161, align 8
  %indvars.iv.next145 = add nsw i64 %indvars.iv144, 1
  %167 = icmp slt i64 %indvars.iv.next145, %100
  br i1 %167, label %.lr.ph53.split, label %.._crit_edge9_crit_edge.loopexit195

.._crit_edge12_crit_edge.loopexit:                ; preds = %._crit_edge43.us
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge.loopexit103:             ; preds = %._crit_edge11.lr.ph
  br label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %.._crit_edge12_crit_edge.loopexit103, %.._crit_edge12_crit_edge.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.._crit_edge12_crit_edge, %._crit_edge9
  %168 = icmp sgt i32 %0, 1
  %169 = load [1200 x double]*, [1200 x double]** %10, align 8
  br i1 %168, label %.lr.ph23, label %226

.lr.ph23:                                         ; preds = %._crit_edge12
  %170 = load [1200 x double]*, [1200 x double]** %9, align 8
  %171 = add nsw i32 %0, -1
  br i1 %140, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %172 = add i32 %0, -2
  %173 = sext i32 %171 to i64
  %174 = sext i32 %0 to i64
  %175 = add i32 %0, 1
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %176 = sext i32 %0 to i64
  %177 = sext i32 %171 to i64
  %178 = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %178, 0
  %179 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv172.in = phi i32 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv172, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv120 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next121, %._crit_edge19.us-lcssa.us.us ]
  %indvars.iv172 = add i32 %indvars.iv172.in, 1
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv120, i64 %indvars.iv120
  store double 1.000000e+00, double* %180, align 8
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %181 = icmp slt i64 %indvars.iv.next121, %176
  br i1 %181, label %.lr.ph18.us, label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge14.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %182 = icmp slt i64 %indvars.iv.next121, %177
  br i1 %182, label %.lr.ph23.split.us, label %._crit_edge24.loopexit

.lr.ph18.us:                                      ; preds = %.lr.ph23.split.us
  %183 = sext i32 %indvars.iv172 to i64
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 0, i64 %indvars.iv120
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %.lr.ph18.us, %._crit_edge14.us.us
  %indvars.iv174 = phi i64 [ %183, %.lr.ph18.us ], [ %indvars.iv.next175, %._crit_edge14.us.us ]
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv120, i64 %indvars.iv174
  store double 0.000000e+00, double* %185, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %186 = load double, double* %184, align 8
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 0, i64 %indvars.iv174
  %188 = load double, double* %187, align 8
  %189 = fmul double %186, %188
  %190 = fadd double %189, 0.000000e+00
  store double %190, double* %185, align 8
  %191 = bitcast double %190 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %192 = phi i64 [ %191, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %193 = phi double [ %190, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %179, label %._crit_edge14.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %194 = bitcast double %211 to i64
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit
  %195 = phi i64 [ %192, %.prol.loopexit ], [ %194, %._crit_edge14.us.us.loopexit ]
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv174, i64 %indvars.iv120
  %197 = bitcast double* %196 to i64*
  store i64 %195, i64* %197, align 8
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, 1
  %198 = icmp slt i64 %indvars.iv.next175, %176
  br i1 %198, label %.lr.ph.us.us, label %._crit_edge19.us-lcssa.us.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %199 = phi double [ %211, %.lr.ph.us.us.new ], [ %193, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 %indvars.iv, i64 %indvars.iv120
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 %indvars.iv, i64 %indvars.iv174
  %203 = load double, double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %204, %199
  store double %205, double* %185, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 %indvars.iv.next, i64 %indvars.iv120
  %207 = load double, double* %206, align 8
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 %indvars.iv.next, i64 %indvars.iv174
  %209 = load double, double* %208, align 8
  %210 = fmul double %207, %209
  %211 = fadd double %210, %205
  store double %211, double* %185, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge14.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %._crit_edge19
  %indvar = phi i32 [ 0, %.lr.ph23.split.preheader ], [ %indvar.next, %._crit_edge19 ]
  %indvars.iv134 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next135, %._crit_edge19 ]
  %indvars.iv128.in = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv128, %._crit_edge19 ]
  %indvars.iv128 = add nsw i64 %indvars.iv128.in, 1
  %212 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %212, align 8
  %indvars.iv.next135 = add nsw i64 %indvars.iv134, 1
  %213 = icmp slt i64 %indvars.iv.next135, %174
  br i1 %213, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph23.split
  %214 = sub i32 %175, %indvar
  %xtraiter158 = and i32 %214, 1
  %lcmp.mod159 = icmp eq i32 %xtraiter158, 0
  br i1 %lcmp.mod159, label %.prol.loopexit157, label %.prol.preheader156

.prol.preheader156:                               ; preds = %.lr.ph18
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv134, i64 %indvars.iv128.in
  store double 0.000000e+00, double* %215, align 8
  %216 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv128.in, i64 %indvars.iv134
  %217 = bitcast double* %216 to i64*
  store i64 0, i64* %217, align 8
  br label %.prol.loopexit157

.prol.loopexit157:                                ; preds = %.prol.preheader156, %.lr.ph18
  %indvars.iv126.unr.ph = phi i64 [ %indvars.iv128, %.prol.preheader156 ], [ %indvars.iv128.in, %.lr.ph18 ]
  %218 = icmp eq i32 %172, %indvar
  br i1 %218, label %._crit_edge19, label %.lr.ph18.new.preheader

.lr.ph18.new.preheader:                           ; preds = %.prol.loopexit157
  br label %.lr.ph18.new

.lr.ph18.new:                                     ; preds = %.lr.ph18.new.preheader, %.lr.ph18.new
  %indvars.iv126 = phi i64 [ %indvars.iv.next127.1, %.lr.ph18.new ], [ %indvars.iv126.unr.ph, %.lr.ph18.new.preheader ]
  %219 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv134, i64 %indvars.iv126
  store double 0.000000e+00, double* %219, align 8
  %220 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv126, i64 %indvars.iv134
  %221 = bitcast double* %220 to i64*
  store i64 0, i64* %221, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %222 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv134, i64 %indvars.iv.next127
  store double 0.000000e+00, double* %222, align 8
  %223 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %indvars.iv.next127, i64 %indvars.iv134
  %224 = bitcast double* %223 to i64*
  store i64 0, i64* %224, align 8
  %indvars.iv.next127.1 = add nsw i64 %indvars.iv126, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next127.1 to i32
  %exitcond132.1 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond132.1, label %._crit_edge19.loopexit, label %.lr.ph18.new

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.new
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.prol.loopexit157, %.lr.ph23.split
  %225 = icmp slt i64 %indvars.iv.next135, %173
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %225, label %.lr.ph23.split, label %._crit_edge24.loopexit102

._crit_edge24.loopexit102:                        ; preds = %._crit_edge19
  br label %._crit_edge24

._crit_edge24.loopexit:                           ; preds = %._crit_edge19.us-lcssa.us.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %._crit_edge24.loopexit102
  br label %226

; <label>:226:                                    ; preds = %._crit_edge24, %._crit_edge12
  %227 = sext i32 %0 to i64
  %228 = add nsw i64 %227, -1
  %229 = getelementptr inbounds [1200 x double], [1200 x double]* %169, i64 %228, i64 %228
  store double 1.000000e+00, double* %229, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %23

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge5.loopexit11

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge3.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge3.us ]
  %9 = mul nsw i64 %8, %indvars.iv13
  br label %10

; <label>:10:                                     ; preds = %17, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %17 ]
  %11 = add i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %17
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %22 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %22, label %._crit_edge.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit11:                          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit11
  br label %23

; <label>:23:                                     ; preds = %._crit_edge5, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
