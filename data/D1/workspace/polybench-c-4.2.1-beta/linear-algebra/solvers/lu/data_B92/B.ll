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
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.lr.ph56:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph46

.lr.ph46:                                         ; preds = %._crit_edge52, %.lr.ph56
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge52 ], [ 0, %.lr.ph56 ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge52 ], [ 1, %.lr.ph56 ]
  %sext = shl i64 %indvars.iv33, 32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph46
  %indvars.iv28 = phi i64 [ 0, %.lr.ph46 ], [ %indvars.iv.next29, %._crit_edge ]
  %3 = sub nsw i64 0, %indvars.iv28
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 2000
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.000000e+03
  %8 = fadd double %7, 1.000000e+00
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv28
  store double %8, double* %9, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond32 = icmp eq i64 %indvars.iv28, %indvars.iv38
  br i1 %exitcond32, label %._crit_edge47, label %._crit_edge

._crit_edge47:                                    ; preds = %._crit_edge
  %10 = ashr exact i64 %sext, 32
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %11 = icmp slt i64 %indvars.iv.next39, 2000
  br i1 %11, label %.lr.ph51.preheader, label %.lr.ph39.split.us.preheader

.lr.ph51.preheader:                               ; preds = %._crit_edge47
  %12 = sub nsw i64 2000, %10
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %.lr.ph51.preheader72, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph51.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %10, %n.vec
  br i1 %cmp.zero, label %.lr.ph51.preheader72, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %13 = add nsw i64 %n.vec, -4
  %14 = lshr exact i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %xtraiter = and i64 %15, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %16 = add i64 %10, %index.prol
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %21 = icmp ult i64 %13, 12
  br i1 %21, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %22 = add i64 %10, %index
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %22
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %index.next = add i64 %index, 4
  %27 = add i64 %10, %index.next
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.1 = add i64 %index, 8
  %32 = add i64 %10, %index.next.1
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next.2 = add i64 %index, 12
  %37 = add i64 %10, %index.next.2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next.3 = add i64 %index, 16
  %42 = icmp eq i64 %index.next.3, %n.vec
  br i1 %42, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %._crit_edge52, label %.lr.ph51.preheader72

.lr.ph51.preheader72:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph51.preheader
  %indvars.iv35.ph = phi i64 [ %10, %min.iters.checked ], [ %10, %.lr.ph51.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51.preheader72, %.lr.ph51
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.lr.ph51 ], [ %indvars.iv35.ph, %.lr.ph51.preheader72 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv35
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv35, 1999
  br i1 %exitcond37, label %._crit_edge52.loopexit, label %.lr.ph51, !llvm.loop !6

._crit_edge52.loopexit:                           ; preds = %.lr.ph51
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit, %middle.block
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %44, align 8
  %indvars.iv.next34 = add nsw i64 %10, 1
  br label %.lr.ph46

.lr.ph39.split.us.preheader:                      ; preds = %._crit_edge47
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %45, align 8
  %46 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %47 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %46, i8** %47, align 8
  %48 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %46 to [2000 x [2000 x double]]*
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us, %.lr.ph39.split.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next26.7, %._crit_edge35.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv25, i64 0
  %scevgep24 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26 = or i64 %indvars.iv25, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv.next26, i64 0
  %scevgep24.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.1 = or i64 %indvars.iv25, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv.next26.1, i64 0
  %scevgep24.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.2 = or i64 %indvars.iv25, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv.next26.2, i64 0
  %scevgep24.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.3 = or i64 %indvars.iv25, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next26.3, i64 0
  %scevgep24.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.4 = or i64 %indvars.iv25, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv.next26.4, i64 0
  %scevgep24.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.5 = or i64 %indvars.iv25, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv.next26.5, i64 0
  %scevgep24.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.6 = or i64 %indvars.iv25, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv.next26.6, i64 0
  %scevgep24.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next26.7 = add nsw i64 %indvars.iv25, 8
  %exitcond76.7 = icmp eq i64 %indvars.iv.next26.7, 2000
  br i1 %exitcond76.7, label %.lr.ph13.us.preheader, label %._crit_edge35.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge35.us
  %56 = bitcast i8* %46 to [2000 x [2000 x double]]*
  %57 = bitcast i8* %46 to [2000 x [2000 x double]]*
  br label %.lr.ph13.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %._crit_edge11.us.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond75, label %.lr.ph3.split.us.preheader, label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us-lcssa.us.us, %.lr.ph13.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge14.us-lcssa.us.us ], [ 0, %.lr.ph13.us.preheader ]
  br label %.lr.ph10.us.us

.lr.ph10.us.us:                                   ; preds = %._crit_edge11.us.us, %.lr.ph13.us
  %indvars.iv16 = phi i64 [ 0, %.lr.ph13.us ], [ %indvars.iv.next17, %._crit_edge11.us.us ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv18
  br label %._crit_edge41

._crit_edge11.us.us:                              ; preds = %._crit_edge41
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond74, label %._crit_edge14.us-lcssa.us.us, label %.lr.ph10.us.us

._crit_edge41:                                    ; preds = %._crit_edge41, %.lr.ph10.us.us
  %indvars.iv13 = phi i64 [ 0, %.lr.ph10.us.us ], [ %indvars.iv.next14.1, %._crit_edge41 ]
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv18
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv16, i64 %indvars.iv13
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %66 = load double, double* %58, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next14, i64 %indvars.iv18
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv16, i64 %indvars.iv.next14
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14, 1999
  br i1 %exitcond15.1, label %._crit_edge11.us.us, label %._crit_edge41

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge14.us-lcssa.us.us
  %73 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %74 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %scevgep53 = getelementptr [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 0
  %75 = add nuw nsw i64 %indvars.iv10, 1
  %scevgep55 = getelementptr [2000 x double], [2000 x double]* %74, i64 %75, i64 0
  %scevgep57 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 0
  %scevgep59 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %75, i64 0
  %bound0 = icmp ult double* %scevgep53, %scevgep59
  %bound1 = icmp ult double* %scevgep57, %scevgep55
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge42.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %.lr.ph3.split.us
  br label %vector.body48

._crit_edge42.preheader:                          ; preds = %.lr.ph3.split.us
  br label %._crit_edge42

vector.body48:                                    ; preds = %vector.body48, %vector.body48.preheader
  %index62 = phi i64 [ 0, %vector.body48.preheader ], [ %index.next63.1, %vector.body48 ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %index62
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load70 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %index62
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %81, align 8, !alias.scope !11, !noalias !8
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load70, <2 x i64>* %83, align 8, !alias.scope !11, !noalias !8
  %index.next63 = or i64 %index62, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %index.next63
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !8
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load70.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %index.next63
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %89, align 8, !alias.scope !11, !noalias !8
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load70.1, <2 x i64>* %91, align 8, !alias.scope !11, !noalias !8
  %index.next63.1 = add nsw i64 %index62, 8
  %92 = icmp eq i64 %index.next63.1, 2000
  br i1 %92, label %._crit_edge.us.loopexit77, label %vector.body48, !llvm.loop !13

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge42.preheader ], [ %indvars.iv.next.4, %._crit_edge42 ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %indvars.iv
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %indvars.iv.next
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %indvars.iv.next.1
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %indvars.iv.next.2
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv10, i64 %indvars.iv.next.3
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv10, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %._crit_edge42, !llvm.loop !14

._crit_edge.us.loopexit:                          ; preds = %._crit_edge42
  br label %._crit_edge.us

._crit_edge.us.loopexit77:                        ; preds = %vector.body48
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit77, %._crit_edge.us.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond73, label %118, label %.lr.ph3.split.us

; <label>:118:                                    ; preds = %._crit_edge.us
  %119 = bitcast [2000 x [2000 x double]]* %73 to i8*
  tail call void @free(i8* %119) #4
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
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge15 ], [ 0, %.lr.ph21 ]
  %indvars.iv11 = phi i32 [ %indvars.iv.next12, %._crit_edge15 ], [ -1, %.lr.ph21 ]
  %3 = phi [2000 x double]* [ %62, %._crit_edge15 ], [ %0, %.lr.ph21 ]
  %4 = add i64 %indvars.iv23, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = icmp sgt i64 %indvars.iv23, 0
  br i1 %6, label %.lr.ph3.preheader, label %._crit_edge15

.lr.ph3.preheader:                                ; preds = %2
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge, %.lr.ph3.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %indvars.iv4 = phi i32 [ %indvars.iv.next5, %._crit_edge ], [ -1, %.lr.ph3.preheader ]
  %7 = phi [2000 x double]* [ %33, %._crit_edge ], [ %3, %.lr.ph3.preheader ]
  %8 = add i64 %indvars.iv6, 4294967295
  %9 = and i64 %8, 4294967295
  %10 = icmp sgt i64 %indvars.iv6, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv23, i64 %indvars.iv6
  %.pre = load double, double* %11, align 8
  %wide.trip.count = zext i32 %indvars.iv4 to i64
  %12 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %._crit_edge21.prol.preheader, label %._crit_edge21.prol.loopexit.unr-lcssa

._crit_edge21.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge21.prol

._crit_edge21.prol:                               ; preds = %._crit_edge21.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv23, i64 0
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 0, i64 %indvars.iv6
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %11, align 8
  br label %._crit_edge21.prol.loopexit.unr-lcssa

._crit_edge21.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge21.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge21.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %18, %._crit_edge21.prol ], [ %.pre, %.lr.ph ]
  br label %._crit_edge21.prol.loopexit

._crit_edge21.prol.loopexit:                      ; preds = %._crit_edge21.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %9, 0
  br i1 %19, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge21.prol.loopexit
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %._crit_edge21 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv23, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv, i64 %indvars.iv6
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv23, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv.next, i64 %indvars.iv6
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge21

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge21
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge21.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph3, %._crit_edge.loopexit
  %33 = phi [2000 x double]* [ %.pre36, %._crit_edge.loopexit ], [ %7, %.lr.ph3 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv6, i64 %indvars.iv6
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv23, i64 %indvars.iv6
  %37 = load double, double* %36, align 8
  %38 = fdiv double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %indvars.iv.next5 = add nsw i32 %indvars.iv4, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next7, %indvars.iv23
  br i1 %exitcond25, label %.lr.ph14..lr.ph14.split.us_crit_edge, label %.lr.ph3

.lr.ph14..lr.ph14.split.us_crit_edge:             ; preds = %._crit_edge
  %39 = load [2000 x double]*, [2000 x double]** %1, align 8
  %wide.trip.count13 = zext i32 %indvars.iv11 to i64
  %40 = and i64 %4, 1
  %lcmp.mod29 = icmp eq i64 %40, 0
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv23, i64 0
  %42 = icmp eq i64 %5, 0
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge10.us, %.lr.ph14..lr.ph14.split.us_crit_edge
  %indvars.iv17 = phi i64 [ %indvars.iv23, %.lr.ph14..lr.ph14.split.us_crit_edge ], [ %indvars.iv.next18, %._crit_edge10.us ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv23, i64 %indvars.iv17
  %.pre37 = load double, double* %43, align 8
  br i1 %lcmp.mod29, label %._crit_edge22.prol.preheader, label %._crit_edge22.prol.loopexit.unr-lcssa

._crit_edge22.prol.preheader:                     ; preds = %.lr.ph14.split.us
  br label %._crit_edge22.prol

._crit_edge22.prol:                               ; preds = %._crit_edge22.prol.preheader
  %44 = load double, double* %41, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 0, i64 %indvars.iv17
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %.pre37, %47
  store double %48, double* %43, align 8
  br label %._crit_edge22.prol.loopexit.unr-lcssa

._crit_edge22.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph14.split.us, %._crit_edge22.prol
  %indvars.iv9.unr.ph = phi i64 [ 1, %._crit_edge22.prol ], [ 0, %.lr.ph14.split.us ]
  %.unr30.ph = phi double [ %48, %._crit_edge22.prol ], [ %.pre37, %.lr.ph14.split.us ]
  br label %._crit_edge22.prol.loopexit

._crit_edge22.prol.loopexit:                      ; preds = %._crit_edge22.prol.loopexit.unr-lcssa
  br i1 %42, label %._crit_edge10.us, label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %._crit_edge22.prol.loopexit
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %.lr.ph14.split.us.new
  %indvars.iv9 = phi i64 [ %indvars.iv9.unr.ph, %.lr.ph14.split.us.new ], [ %indvars.iv.next10.1, %._crit_edge22 ]
  %49 = phi double [ %.unr30.ph, %.lr.ph14.split.us.new ], [ %61, %._crit_edge22 ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv23, i64 %indvars.iv9
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv9, i64 %indvars.iv17
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %43, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv23, i64 %indvars.iv.next10
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv.next10, i64 %indvars.iv17
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %55, %60
  store double %61, double* %43, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next10, %wide.trip.count13
  br i1 %exitcond14.1, label %._crit_edge10.us.unr-lcssa, label %._crit_edge22

._crit_edge10.us.unr-lcssa:                       ; preds = %._crit_edge22
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge22.prol.loopexit, %._crit_edge10.us.unr-lcssa
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond26, label %._crit_edge15.loopexit, label %.lr.ph14.split.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %62 = phi [2000 x double]* [ %3, %2 ], [ %39, %._crit_edge15.loopexit ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %indvars.iv.next12 = add nsw i32 %indvars.iv11, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond27, label %63, label %2

; <label>:63:                                     ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph3.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next2, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond4, label %16, label %.lr.ph3.split.us

; <label>:16:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
