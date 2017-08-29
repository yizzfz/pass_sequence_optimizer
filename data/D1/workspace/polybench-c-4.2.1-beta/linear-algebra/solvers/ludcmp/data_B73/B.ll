; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph64:
  %5 = alloca [2000 x double]*, align 8
  %6 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %5, align 8
  br label %._crit_edge77

._crit_edge11.lr.ph:                              ; preds = %._crit_edge77
  br label %.lr.ph47

._crit_edge77:                                    ; preds = %._crit_edge77, %.lr.ph64
  %indvars.iv114 = phi i64 [ 0, %.lr.ph64 ], [ %indvars.iv.next115.1, %._crit_edge77 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv114
  %8 = bitcast double* %7 to <2 x double>*
  %9 = getelementptr inbounds double, double* %4, i64 %indvars.iv114
  %10 = bitcast double* %9 to <2 x double>*
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %11 = trunc i64 %indvars.iv.next115 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv114
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %10, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %14 = trunc i64 %indvars.iv.next115.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond130.1 = icmp eq i64 %indvars.iv.next115, 1999
  br i1 %exitcond130.1, label %._crit_edge11.lr.ph, label %._crit_edge77

.lr.ph47:                                         ; preds = %._crit_edge54, %._crit_edge11.lr.ph
  %indvars.iv128 = phi i64 [ 0, %._crit_edge11.lr.ph ], [ %indvars.iv.next129, %._crit_edge54 ]
  %22 = sub i64 1999, %indvars.iv128
  %23 = add i64 %22, -4
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %26 = sub i64 1999, %indvars.iv128
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78, %.lr.ph47
  %indvars.iv109 = phi i64 [ 0, %.lr.ph47 ], [ %indvars.iv.next110, %._crit_edge78 ]
  %27 = sub nsw i64 0, %indvars.iv109
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv109
  store double %32, double* %33, align 8
  %indvars.iv.next110 = add nuw i64 %indvars.iv109, 1
  %34 = icmp sgt i64 %indvars.iv.next110, %indvars.iv128
  br i1 %34, label %._crit_edge48, label %._crit_edge78

._crit_edge48:                                    ; preds = %._crit_edge78
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %35 = icmp slt i64 %indvars.iv.next129, 2000
  br i1 %35, label %.lr.ph53.preheader, label %._crit_edge54.thread

.lr.ph53.preheader:                               ; preds = %._crit_edge48
  %min.iters.check = icmp ult i64 %26, 4
  br i1 %min.iters.check, label %.lr.ph53.preheader198, label %min.iters.checked

.lr.ph53.preheader198:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph53.preheader
  %indvars.iv111.ph = phi i64 [ %indvars.iv.next129, %min.iters.checked ], [ %indvars.iv.next129, %.lr.ph53.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph53

min.iters.checked:                                ; preds = %.lr.ph53.preheader
  %n.vec = and i64 %26, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next129, %n.vec
  br i1 %cmp.zero, label %.lr.ph53.preheader198, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %25, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %36 = add i64 %indvars.iv.next129, %index.prol
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %40, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %41 = icmp ult i64 %23, 12
  br i1 %41, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %42 = add i64 %indvars.iv.next129, %index
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next = add i64 %index, 4
  %47 = add i64 %indvars.iv.next129, %index.next
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %index.next.1 = add i64 %index, 8
  %52 = add i64 %indvars.iv.next129, %index.next.1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %index.next.2 = add i64 %index, 12
  %57 = add i64 %indvars.iv.next129, %index.next.2
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %57
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %61, align 8
  %index.next.3 = add i64 %index, 16
  %62 = icmp eq i64 %index.next.3, %n.vec
  br i1 %62, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %26, %n.vec
  br i1 %cmp.n, label %._crit_edge54, label %.lr.ph53.preheader198

._crit_edge54.thread:                             ; preds = %._crit_edge48
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %63, align 8
  br label %._crit_edge._crit_edge

.lr.ph53:                                         ; preds = %.lr.ph53.preheader198, %.lr.ph53
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %.lr.ph53 ], [ %indvars.iv111.ph, %.lr.ph53.preheader198 ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv111
  store double 0.000000e+00, double* %64, align 8
  %exitcond127 = icmp eq i64 %indvars.iv111, 1999
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  br i1 %exitcond127, label %._crit_edge54.loopexit, label %.lr.ph53, !llvm.loop !6

._crit_edge54.loopexit:                           ; preds = %.lr.ph53
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %middle.block
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %65, align 8
  br i1 true, label %.lr.ph47, label %._crit_edge._crit_edge.loopexit

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge54
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit, %._crit_edge54.thread
  %66 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %67 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %66, i8** %67, align 8
  %68 = bitcast i8* %66 to [2000 x [2000 x double]]*
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us, %._crit_edge._crit_edge
  %indvars.iv106 = phi i64 [ 0, %._crit_edge._crit_edge ], [ %indvars.iv.next107.7, %._crit_edge40.us ]
  %69 = mul nuw nsw i64 %indvars.iv106, 16000
  %scevgep = getelementptr i8, i8* %66, i64 %69
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %70 = mul nuw nsw i64 %indvars.iv.next107, 16000
  %scevgep.1 = getelementptr i8, i8* %66, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.1 = or i64 %indvars.iv106, 2
  %71 = mul nuw nsw i64 %indvars.iv.next107.1, 16000
  %scevgep.2 = getelementptr i8, i8* %66, i64 %71
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.2 = or i64 %indvars.iv106, 3
  %72 = mul nuw nsw i64 %indvars.iv.next107.2, 16000
  %scevgep.3 = getelementptr i8, i8* %66, i64 %72
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.3 = or i64 %indvars.iv106, 4
  %73 = mul nuw nsw i64 %indvars.iv.next107.3, 16000
  %scevgep.4 = getelementptr i8, i8* %66, i64 %73
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.4 = or i64 %indvars.iv106, 5
  %74 = mul nuw nsw i64 %indvars.iv.next107.4, 16000
  %scevgep.5 = getelementptr i8, i8* %66, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.5 = or i64 %indvars.iv106, 6
  %75 = mul nuw nsw i64 %indvars.iv.next107.5, 16000
  %scevgep.6 = getelementptr i8, i8* %66, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.6 = or i64 %indvars.iv106, 7
  %76 = mul nuw nsw i64 %indvars.iv.next107.6, 16000
  %scevgep.7 = getelementptr i8, i8* %66, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  %77 = icmp slt i64 %indvars.iv.next107.7, 2000
  br i1 %77, label %._crit_edge40.us, label %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge

._crit_edge14.lr.ph.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge40.us
  br label %._crit_edge14.us.._crit_edge16.us.us_crit_edge

._crit_edge14.us.._crit_edge16.us.us_crit_edge:   ; preds = %._crit_edge29.us, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge
  %indvars.iv100 = phi i64 [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ], [ %78, %._crit_edge29.us ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv100
  %78 = add i64 %indvars.iv100, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %78
  br label %._crit_edge16.us.us

._crit_edge29.us:                                 ; preds = %._crit_edge27.us.us
  %79 = icmp slt i64 %78, 2000
  br i1 %79, label %._crit_edge14.us.._crit_edge16.us.us_crit_edge, label %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge27.us.us, %._crit_edge14.us.._crit_edge16.us.us_crit_edge
  %indvars.iv98 = phi i64 [ 0, %._crit_edge14.us.._crit_edge16.us.us_crit_edge ], [ %80, %._crit_edge27.us.us ]
  %scevgep145 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv98, i64 0
  %80 = add i64 %indvars.iv98, 1
  %scevgep147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %80, i64 0
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv100
  %bound0 = icmp ult double* %scevgep145, %scevgep151
  %bound1 = icmp ult double* %scevgep149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bound0154 = icmp ult double* %scevgep145, %81
  %bound1155 = icmp ult double* %81, %scevgep147
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  br i1 %conflict.rdx, label %scalar.ph142.preheader, label %vector.body140.preheader

vector.body140.preheader:                         ; preds = %._crit_edge16.us.us
  br label %vector.body140

scalar.ph142.preheader:                           ; preds = %._crit_edge16.us.us
  br label %scalar.ph142

vector.body140:                                   ; preds = %vector.body140.preheader, %vector.body140
  %index158 = phi i64 [ %index.next159, %vector.body140 ], [ 0, %vector.body140.preheader ]
  %82 = or i64 %index158, 1
  %83 = or i64 %index158, 2
  %84 = or i64 %index158, 3
  %85 = load double, double* %81, align 8, !alias.scope !8
  %86 = insertelement <2 x double> undef, double %85, i32 0
  %87 = shufflevector <2 x double> %86, <2 x double> undef, <2 x i32> zeroinitializer
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index158, i64 %indvars.iv100
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %82, i64 %indvars.iv100
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %83, i64 %indvars.iv100
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %84, i64 %indvars.iv100
  %92 = load double, double* %88, align 8, !alias.scope !11
  %93 = load double, double* %89, align 8, !alias.scope !11
  %94 = load double, double* %90, align 8, !alias.scope !11
  %95 = load double, double* %91, align 8, !alias.scope !11
  %96 = insertelement <2 x double> undef, double %92, i32 0
  %97 = insertelement <2 x double> %96, double %93, i32 1
  %98 = insertelement <2 x double> undef, double %94, i32 0
  %99 = insertelement <2 x double> %98, double %95, i32 1
  %100 = fmul <2 x double> %87, %97
  %101 = fmul <2 x double> %87, %99
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv98, i64 %index158
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !13, !noalias !15
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !13, !noalias !15
  %106 = fadd <2 x double> %100, %wide.load
  %107 = fadd <2 x double> %101, %wide.load166
  store <2 x double> %106, <2 x double>* %103, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %107, <2 x double>* %105, align 8, !alias.scope !13, !noalias !15
  %index.next159 = add i64 %index158, 4
  %108 = icmp eq i64 %index.next159, 2000
  br i1 %108, label %._crit_edge27.us.us.loopexit197, label %vector.body140, !llvm.loop !16

._crit_edge27.us.us.loopexit:                     ; preds = %scalar.ph142
  br label %._crit_edge27.us.us

._crit_edge27.us.us.loopexit197:                  ; preds = %vector.body140
  br label %._crit_edge27.us.us

._crit_edge27.us.us:                              ; preds = %._crit_edge27.us.us.loopexit197, %._crit_edge27.us.us.loopexit
  %109 = icmp slt i64 %80, 2000
  br i1 %109, label %._crit_edge16.us.us, label %._crit_edge29.us

scalar.ph142:                                     ; preds = %scalar.ph142, %scalar.ph142.preheader
  %indvars.iv95 = phi i64 [ 0, %scalar.ph142.preheader ], [ %indvars.iv.next96.1, %scalar.ph142 ]
  %110 = load double, double* %81, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv100
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv98, i64 %indvars.iv95
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  store double %116, double* %114, align 8
  %indvars.iv.next96 = or i64 %indvars.iv95, 1
  %117 = load double, double* %81, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96, i64 %indvars.iv100
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next96
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  store double %123, double* %121, align 8
  %exitcond123.1 = icmp eq i64 %indvars.iv.next96, 1999
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  br i1 %exitcond123.1, label %._crit_edge27.us.us.loopexit, label %scalar.ph142, !llvm.loop !17

._crit_edge17.lr.ph.._crit_edge17.us_crit_edge:   ; preds = %._crit_edge29.us
  %124 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  %125 = load [2000 x double]*, [2000 x double]** %5, align 8
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge19.us, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge
  %indvars.iv92 = phi i64 [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ], [ %126, %._crit_edge19.us ]
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 0
  %126 = add i64 %indvars.iv92, 1
  %scevgep174 = getelementptr [2000 x double], [2000 x double]* %125, i64 %126, i64 0
  %scevgep176 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 0
  %scevgep178 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %126, i64 0
  %bound0180 = icmp ult double* %scevgep172, %scevgep178
  %bound1181 = icmp ult double* %scevgep176, %scevgep174
  %memcheck.conflict183 = and i1 %bound0180, %bound1181
  br i1 %memcheck.conflict183, label %scalar.ph169.preheader, label %vector.body167.preheader

vector.body167.preheader:                         ; preds = %._crit_edge17.us
  br label %vector.body167

scalar.ph169.preheader:                           ; preds = %._crit_edge17.us
  br label %scalar.ph169

vector.body167:                                   ; preds = %vector.body167, %vector.body167.preheader
  %index186 = phi i64 [ 0, %vector.body167.preheader ], [ %index.next187.1, %vector.body167 ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %index186
  %128 = bitcast double* %127 to <2 x i64>*
  %wide.load194 = load <2 x i64>, <2 x i64>* %128, align 8, !alias.scope !18
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x i64>*
  %wide.load195 = load <2 x i64>, <2 x i64>* %130, align 8, !alias.scope !18
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %index186
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %wide.load194, <2 x i64>* %132, align 8, !alias.scope !21, !noalias !18
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x i64>*
  store <2 x i64> %wide.load195, <2 x i64>* %134, align 8, !alias.scope !21, !noalias !18
  %index.next187 = or i64 %index186, 4
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %index.next187
  %136 = bitcast double* %135 to <2 x i64>*
  %wide.load194.1 = load <2 x i64>, <2 x i64>* %136, align 8, !alias.scope !18
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x i64>*
  %wide.load195.1 = load <2 x i64>, <2 x i64>* %138, align 8, !alias.scope !18
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %index.next187
  %140 = bitcast double* %139 to <2 x i64>*
  store <2 x i64> %wide.load194.1, <2 x i64>* %140, align 8, !alias.scope !21, !noalias !18
  %141 = getelementptr double, double* %139, i64 2
  %142 = bitcast double* %141 to <2 x i64>*
  store <2 x i64> %wide.load195.1, <2 x i64>* %142, align 8, !alias.scope !21, !noalias !18
  %index.next187.1 = add nsw i64 %index186, 8
  %143 = icmp eq i64 %index.next187.1, 2000
  br i1 %143, label %._crit_edge19.us.loopexit196, label %vector.body167, !llvm.loop !23

scalar.ph169:                                     ; preds = %scalar.ph169, %scalar.ph169.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph169.preheader ], [ %indvars.iv.next.4, %scalar.ph169 ]
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %indvars.iv
  %145 = bitcast double* %144 to i64*
  %146 = load i64, i64* %145, align 8
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %indvars.iv
  %148 = bitcast double* %147 to i64*
  store i64 %146, i64* %148, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %149 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next
  %150 = bitcast double* %149 to i64*
  %151 = load i64, i64* %150, align 8
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %indvars.iv.next
  %153 = bitcast double* %152 to i64*
  store i64 %151, i64* %153, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %154 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %155 = bitcast double* %154 to i64*
  %156 = load i64, i64* %155, align 8
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %158 = bitcast double* %157 to i64*
  store i64 %156, i64* %158, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %159 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %160 = bitcast double* %159 to i64*
  %161 = load i64, i64* %160, align 8
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %163 = bitcast double* %162 to i64*
  store i64 %161, i64* %163, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %164 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.3
  %165 = bitcast double* %164 to i64*
  %166 = load i64, i64* %165, align 8
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %indvars.iv92, i64 %indvars.iv.next.3
  %168 = bitcast double* %167 to i64*
  store i64 %166, i64* %168, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge19.us.loopexit, label %scalar.ph169, !llvm.loop !24

._crit_edge19.us.loopexit:                        ; preds = %scalar.ph169
  br label %._crit_edge19.us

._crit_edge19.us.loopexit196:                     ; preds = %vector.body167
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit196, %._crit_edge19.us.loopexit
  %169 = icmp slt i64 %126, 2000
  br i1 %169, label %._crit_edge17.us, label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge19.us
  %170 = bitcast [2000 x [2000 x double]]* %124 to i8*
  call void @free(i8* %170) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge55, %._crit_edge.lr.ph
  %indvars.iv139 = phi i32 [ -1, %._crit_edge.lr.ph ], [ %indvars.iv.next140, %._crit_edge55 ]
  %indvars.iv125 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next126, %._crit_edge55 ]
  %5 = add i64 %indvars.iv125, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = zext i32 %indvars.iv139 to i64
  %indvars.iv.next140 = add i32 %indvars.iv139, 1
  %8 = icmp sgt i64 %indvars.iv125, 0
  br i1 %8, label %.lr.ph41.preheader, label %._crit_edge55

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge69
  %indvars.iv136 = phi i32 [ %indvars.iv.next137, %._crit_edge69 ], [ -1, %.lr.ph41.preheader ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge69 ], [ 0, %.lr.ph41.preheader ]
  %10 = add i64 %indvars.iv103, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = zext i32 %indvars.iv136 to i64
  %indvars.iv.next137 = add i32 %indvars.iv136, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv103
  %14 = load double, double* %13, align 8
  %15 = icmp sgt i64 %indvars.iv103, 0
  br i1 %15, label %.lr.ph36.preheader, label %._crit_edge69

.lr.ph36.preheader:                               ; preds = %.lr.ph41
  %16 = and i64 %10, 1
  %lcmp.mod164 = icmp eq i64 %16, 0
  br i1 %lcmp.mod164, label %.lr.ph36.prol.preheader, label %.lr.ph36.prol.loopexit.unr-lcssa

.lr.ph36.prol.preheader:                          ; preds = %.lr.ph36.preheader
  br label %.lr.ph36.prol

.lr.ph36.prol:                                    ; preds = %.lr.ph36.prol.preheader
  %17 = load double, double* %9, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv103
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %14, %20
  br label %.lr.ph36.prol.loopexit.unr-lcssa

.lr.ph36.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph36.preheader, %.lr.ph36.prol
  %.lcssa161.unr.ph = phi double [ %21, %.lr.ph36.prol ], [ undef, %.lr.ph36.preheader ]
  %indvars.iv97.unr.ph = phi i64 [ 1, %.lr.ph36.prol ], [ 0, %.lr.ph36.preheader ]
  %.unr165.ph = phi double [ %21, %.lr.ph36.prol ], [ %14, %.lr.ph36.preheader ]
  br label %.lr.ph36.prol.loopexit

.lr.ph36.prol.loopexit:                           ; preds = %.lr.ph36.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %11, 0
  br i1 %22, label %._crit_edge69.loopexit, label %.lr.ph36.preheader.new

.lr.ph36.preheader.new:                           ; preds = %.lr.ph36.prol.loopexit
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %.lr.ph36.preheader.new ], [ %indvars.iv.next98.1, %.lr.ph36 ]
  %23 = phi double [ %.unr165.ph, %.lr.ph36.preheader.new ], [ %37, %.lr.ph36 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv97
  %25 = bitcast double* %24 to <2 x double>*
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv103
  %27 = load double, double* %26, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %28 = load <2 x double>, <2 x double>* %25, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next98, i64 %indvars.iv103
  %30 = load double, double* %29, align 8
  %31 = insertelement <2 x double> undef, double %27, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %28, %32
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fsub double %23, %34
  %37 = fsub double %36, %35
  %exitcond.1 = icmp eq i64 %indvars.iv.next98, %12
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond.1, label %._crit_edge69.loopexit.unr-lcssa, label %.lr.ph36

._crit_edge69.loopexit.unr-lcssa:                 ; preds = %.lr.ph36
  br label %._crit_edge69.loopexit

._crit_edge69.loopexit:                           ; preds = %.lr.ph36.prol.loopexit, %._crit_edge69.loopexit.unr-lcssa
  %.lcssa161 = phi double [ %.lcssa161.unr.ph, %.lr.ph36.prol.loopexit ], [ %37, %._crit_edge69.loopexit.unr-lcssa ]
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69.loopexit, %.lr.ph41
  %38 = phi double [ %14, %.lr.ph41 ], [ %.lcssa161, %._crit_edge69.loopexit ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv103
  %40 = load double, double* %39, align 8
  %41 = fdiv double %38, %40
  store double %41, double* %13, align 8
  %indvars.iv.next104 = add nuw i64 %indvars.iv103, 1
  %42 = icmp slt i64 %indvars.iv.next104, %indvars.iv125
  br i1 %42, label %.lr.ph41, label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge69
  br i1 true, label %.lr.ph54.split.us.preheader, label %.lr.ph54.._crit_edge55_crit_edge

.lr.ph54.._crit_edge55_crit_edge:                 ; preds = %.lr.ph54
  br label %._crit_edge55

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %43 = and i64 %5, 1
  %lcmp.mod169 = icmp eq i64 %43, 0
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 0
  %45 = icmp eq i64 %6, 0
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge48.us
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge48.us ], [ %indvars.iv125, %.lr.ph54.split.us.preheader ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv123
  %47 = load double, double* %46, align 8
  br i1 %lcmp.mod169, label %.prol.preheader166, label %.prol.loopexit167.unr-lcssa

.prol.preheader166:                               ; preds = %.lr.ph54.split.us
  br label %48

; <label>:48:                                     ; preds = %.prol.preheader166
  %49 = load double, double* %44, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv123
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  br label %.prol.loopexit167.unr-lcssa

.prol.loopexit167.unr-lcssa:                      ; preds = %.lr.ph54.split.us, %48
  %.lcssa162.unr.ph = phi double [ %53, %48 ], [ undef, %.lr.ph54.split.us ]
  %indvars.iv115.unr.ph = phi i64 [ 1, %48 ], [ 0, %.lr.ph54.split.us ]
  %.unr170.ph = phi double [ %53, %48 ], [ %47, %.lr.ph54.split.us ]
  br label %.prol.loopexit167

.prol.loopexit167:                                ; preds = %.prol.loopexit167.unr-lcssa
  br i1 %45, label %._crit_edge48.us, label %.lr.ph54.split.us.new

.lr.ph54.split.us.new:                            ; preds = %.prol.loopexit167
  br label %54

; <label>:54:                                     ; preds = %54, %.lr.ph54.split.us.new
  %indvars.iv115 = phi i64 [ %indvars.iv115.unr.ph, %.lr.ph54.split.us.new ], [ %indvars.iv.next116.1, %54 ]
  %55 = phi double [ %.unr170.ph, %.lr.ph54.split.us.new ], [ %69, %54 ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv115
  %57 = bitcast double* %56 to <2 x double>*
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv115, i64 %indvars.iv123
  %59 = load double, double* %58, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %60 = load <2 x double>, <2 x double>* %57, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next116, i64 %indvars.iv123
  %62 = load double, double* %61, align 8
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = fmul <2 x double> %60, %64
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fsub double %55, %66
  %69 = fsub double %68, %67
  %exitcond141.1 = icmp eq i64 %indvars.iv.next116, %7
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  br i1 %exitcond141.1, label %._crit_edge48.us.unr-lcssa, label %54

._crit_edge48.us.unr-lcssa:                       ; preds = %54
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit167, %._crit_edge48.us.unr-lcssa
  %.lcssa162 = phi double [ %.lcssa162.unr.ph, %.prol.loopexit167 ], [ %69, %._crit_edge48.us.unr-lcssa ]
  store double %.lcssa162, double* %46, align 8
  %indvars.iv.next124 = add i64 %indvars.iv123, 1
  %70 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %70, label %.lr.ph54.split.us, label %._crit_edge55.loopexit

._crit_edge55.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %.lr.ph54.._crit_edge55_crit_edge, %._crit_edge55.loopexit, %._crit_edge
  %indvars.iv.next126 = add i64 %indvars.iv125, 1
  %71 = icmp slt i64 %indvars.iv.next126, 2000
  br i1 %71, label %._crit_edge, label %.lr.ph29.preheader

.lr.ph29.preheader:                               ; preds = %._crit_edge55
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %._crit_edge73
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge73 ], [ 4294967295, %.lr.ph29.preheader ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge73 ], [ 0, %.lr.ph29.preheader ]
  %72 = and i64 %indvars.iv133, 4294967295
  %73 = getelementptr inbounds double, double* %2, i64 %indvars.iv95
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = icmp sgt i64 %indvars.iv95, 0
  br i1 %76, label %.lr.ph24, label %._crit_edge73

.lr.ph24:                                         ; preds = %.lr.ph29
  %77 = bitcast i64 %75 to double
  %78 = add nsw i64 %indvars.iv133, 1
  %xtraiter = and i64 %78, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph24
  br label %79

; <label>:79:                                     ; preds = %79, %.prol.preheader
  %indvars.iv91.prol = phi i64 [ %indvars.iv.next92.prol, %79 ], [ 0, %.prol.preheader ]
  %80 = phi double [ %86, %79 ], [ %77, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %79 ], [ %xtraiter, %.prol.preheader ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv91.prol
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv91.prol
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next92.prol = add nuw nsw i64 %indvars.iv91.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %79, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %79
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph24, %.prol.loopexit.unr-lcssa
  %.lcssa160.unr = phi double [ undef, %.lr.ph24 ], [ %86, %.prol.loopexit.unr-lcssa ]
  %indvars.iv91.unr = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next92.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %77, %.lr.ph24 ], [ %86, %.prol.loopexit.unr-lcssa ]
  %87 = icmp ult i64 %72, 3
  br i1 %87, label %._crit_edge25, label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.prol.loopexit
  br label %88

; <label>:88:                                     ; preds = %88, %.lr.ph24.new
  %indvars.iv91 = phi i64 [ %indvars.iv91.unr, %.lr.ph24.new ], [ %indvars.iv.next92.3, %88 ]
  %89 = phi double [ %.unr, %.lr.ph24.new ], [ %111, %88 ]
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv91
  %91 = bitcast double* %90 to <2 x double>*
  %92 = getelementptr inbounds double, double* %4, i64 %indvars.iv91
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %91, align 8
  %95 = load <2 x double>, <2 x double>* %93, align 8
  %96 = fmul <2 x double> %94, %95
  %97 = extractelement <2 x double> %96, i32 0
  %98 = extractelement <2 x double> %96, i32 1
  %99 = fsub double %89, %97
  %100 = fsub double %99, %98
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next92.1
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next92.1
  %104 = bitcast double* %103 to <2 x double>*
  %indvars.iv.next92.2 = add nsw i64 %indvars.iv91, 3
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %100, %108
  %111 = fsub double %110, %109
  %exitcond135.3 = icmp eq i64 %indvars.iv.next92.2, %72
  %indvars.iv.next92.3 = add nsw i64 %indvars.iv91, 4
  br i1 %exitcond135.3, label %._crit_edge25.unr-lcssa, label %88

._crit_edge25.unr-lcssa:                          ; preds = %88
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.prol.loopexit, %._crit_edge25.unr-lcssa
  %.lcssa160 = phi double [ %.lcssa160.unr, %.prol.loopexit ], [ %111, %._crit_edge25.unr-lcssa ]
  %112 = bitcast double %.lcssa160 to i64
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %.lr.ph29, %._crit_edge25
  %113 = phi i64 [ %112, %._crit_edge25 ], [ %75, %.lr.ph29 ]
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv95
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next96 = add i64 %indvars.iv95, 1
  %116 = icmp slt i64 %indvars.iv.next96, 2000
  %indvars.iv.next134 = add nuw nsw i64 %72, 1
  br i1 %116, label %.lr.ph29, label %.lr.ph17.preheader

.lr.ph17.preheader:                               ; preds = %._crit_edge73
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %.lr.ph17.preheader, %._crit_edge79
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge79 ], [ 1999, %.lr.ph17.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge79 ], [ 2000, %.lr.ph17.preheader ]
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv88
  %118 = load double, double* %117, align 8
  %119 = add nsw i64 %indvars.iv88, 1
  %120 = icmp slt i64 %119, 2000
  br i1 %120, label %.lr.ph, label %._crit_edge77

.lr.ph:                                           ; preds = %.lr.ph17
  %121 = sext i32 %indvars.iv to i64
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78, %.lr.ph
  %indvars.iv82 = phi i64 [ %121, %.lr.ph ], [ %indvars.iv.next83, %._crit_edge78 ]
  %122 = phi double [ %118, %.lr.ph ], [ %128, %._crit_edge78 ]
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv82
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv82
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fsub double %122, %127
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %129 = icmp slt i64 %indvars.iv.next83, 2000
  br i1 %129, label %._crit_edge78, label %._crit_edge77.loopexit

._crit_edge77.loopexit:                           ; preds = %._crit_edge78
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.lr.ph17
  %130 = phi double [ %118, %.lr.ph17 ], [ %128, %._crit_edge77.loopexit ]
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv88
  %132 = load double, double* %131, align 8
  %133 = fdiv double %130, %132
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  store double %133, double* %134, align 8
  %135 = icmp sgt i64 %indvars.iv88, 0
  br i1 %135, label %._crit_edge79, label %._crit_edge76

._crit_edge79:                                    ; preds = %._crit_edge77
  %indvars.iv.next89 = add i64 %indvars.iv88, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %.lr.ph17

._crit_edge76:                                    ; preds = %._crit_edge77
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %._crit_edge3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge3, label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
!25 = distinct !{!25, !2}
