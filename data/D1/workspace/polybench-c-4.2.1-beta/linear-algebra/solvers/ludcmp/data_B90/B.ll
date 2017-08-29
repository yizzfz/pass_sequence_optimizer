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
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
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
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
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
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph116:
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph116
  %indvars.iv77114 = phi i64 [ 0, %.lr.ph116 ], [ %indvars.iv.next78.1, %4 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv77114
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv77114
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77114, 1
  %7 = trunc i64 %indvars.iv.next78 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv77114
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next78
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next78
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77114, 2
  %15 = trunc i64 %indvars.iv.next78.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next78
  store double %19, double* %20, align 8
  %exitcond119.1 = icmp eq i64 %indvars.iv.next78.1, 2000
  br i1 %exitcond119.1, label %..preheader86_crit_edge.preheader, label %4

..preheader86_crit_edge.preheader:                ; preds = %4
  br label %..preheader86_crit_edge

..preheader86_crit_edge:                          ; preds = %.loopexit4, %..preheader86_crit_edge.preheader
  %indvars.iv73112 = phi i64 [ 1, %..preheader86_crit_edge.preheader ], [ %indvars.iv.next74, %.loopexit4 ]
  %indvars.iv75111 = phi i64 [ 0, %..preheader86_crit_edge.preheader ], [ %indvars.iv.next76, %.loopexit4 ]
  %21 = sub i64 1999, %indvars.iv75111
  %22 = add i64 %21, -4
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  br label %.preheader86

.preheader86..preheader85_crit_edge:              ; preds = %.preheader86
  %25 = sub nuw nsw i64 1999, %indvars.iv75111
  %indvars.iv.next66107 = add nuw nsw i64 %indvars.iv75111, 1
  %exitcond82108 = icmp eq i64 %indvars.iv75111, 1999
  br i1 %exitcond82108, label %.loopexit4, label %.lr.ph110

.lr.ph110:                                        ; preds = %.preheader86..preheader85_crit_edge
  %min.iters.check = icmp ult i64 %25, 4
  br i1 %min.iters.check, label %.preheader85.preheader, label %min.iters.checked

.preheader85.preheader:                           ; preds = %middle.block, %min.iters.checked, %.lr.ph110
  %indvars.iv.next66109.ph = phi i64 [ %indvars.iv.next66107, %.lr.ph110 ], [ %indvars.iv.next66107, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %.preheader85

min.iters.checked:                                ; preds = %.lr.ph110
  %n.vec = and i64 %25, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next66107, %n.vec
  br i1 %cmp.zero, label %.preheader85.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %24, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %26 = add i64 %indvars.iv.next66107, %index.prol
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %31 = icmp ult i64 %22, 12
  br i1 %31, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %32 = add i64 %indvars.iv.next66107, %index
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next = add i64 %index, 4
  %37 = add i64 %indvars.iv.next66107, %index.next
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next.1 = add i64 %index, 8
  %42 = add i64 %indvars.iv.next66107, %index.next.1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next.2 = add i64 %index, 12
  %47 = add i64 %indvars.iv.next66107, %index.next.2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %index.next.3 = add i64 %index, 16
  %52 = icmp eq i64 %index.next.3, %n.vec
  br i1 %52, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %25, %n.vec
  br i1 %cmp.n, label %.loopexit4, label %.preheader85.preheader

.preheader86:                                     ; preds = %.preheader86, %..preheader86_crit_edge
  %indvars.iv57106 = phi i64 [ 0, %..preheader86_crit_edge ], [ %indvars.iv.next58, %.preheader86 ]
  %53 = sub nsw i64 0, %indvars.iv57106
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 2000
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, 2.000000e+03
  %58 = fadd double %57, 1.000000e+00
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %indvars.iv57106
  store double %58, double* %59, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57106, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %indvars.iv73112
  br i1 %exitcond62, label %.preheader86..preheader85_crit_edge, label %.preheader86

.preheader85:                                     ; preds = %.preheader85, %.preheader85.preheader
  %indvars.iv.next66109 = phi i64 [ %indvars.iv.next66109.ph, %.preheader85.preheader ], [ %indvars.iv.next66, %.preheader85 ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %indvars.iv.next66109
  store double 0.000000e+00, double* %60, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv.next66109, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next66109, 1999
  br i1 %exitcond82, label %.loopexit4.loopexit, label %.preheader85, !llvm.loop !6

.loopexit4.loopexit:                              ; preds = %.preheader85
  br label %.loopexit4

.loopexit4:                                       ; preds = %.loopexit4.loopexit, %middle.block, %.preheader86..preheader85_crit_edge
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75111, i64 %indvars.iv75111
  store double 1.000000e+00, double* %61, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75111, 1
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73112, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond118, label %.loopexit5, label %..preheader86_crit_edge

.loopexit5:                                       ; preds = %.loopexit4
  %62 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %63 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %64 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %65 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %66 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %67 = bitcast i8* %62 to [2000 x [2000 x double]]*
  br label %..preheader84_crit_edge

..preheader84_crit_edge:                          ; preds = %.loopexit2, %.loopexit5
  %indvars.iv55103 = phi i64 [ 0, %.loopexit5 ], [ %indvars.iv.next56, %.loopexit2 ]
  br label %vector.body8

vector.body8:                                     ; preds = %vector.body8, %..preheader84_crit_edge
  %index13 = phi i64 [ 0, %..preheader84_crit_edge ], [ %index.next14.4, %vector.body8 ]
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv55103, i64 %index13
  %69 = bitcast double* %68 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %69, align 8
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %71, align 8
  %index.next14 = add nuw nsw i64 %index13, 4
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv55103, i64 %index.next14
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %73, align 8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %75, align 8
  %index.next14.1 = add nsw i64 %index13, 8
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv55103, i64 %index.next14.1
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %77, align 8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %79, align 8
  %index.next14.2 = add nsw i64 %index13, 12
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv55103, i64 %index.next14.2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %81, align 8
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %83, align 8
  %index.next14.3 = add nsw i64 %index13, 16
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv55103, i64 %index.next14.3
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %85, align 8
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %87, align 8
  %index.next14.4 = add nsw i64 %index13, 20
  %88 = icmp eq i64 %index.next14.4, 2000
  br i1 %88, label %.loopexit2, label %vector.body8, !llvm.loop !8

.loopexit2:                                       ; preds = %vector.body8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55103, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond76, label %..preheader1_crit_edge.preheader, label %..preheader84_crit_edge

..preheader1_crit_edge.preheader:                 ; preds = %.loopexit2
  %89 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %90 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %91 = bitcast i8* %62 to [2000 x [2000 x double]]*
  br label %..preheader1_crit_edge

..preheader1_crit_edge:                           ; preds = %.loopexit1, %..preheader1_crit_edge.preheader
  %indvars.iv4998 = phi i64 [ 0, %..preheader1_crit_edge.preheader ], [ %indvars.iv.next50, %.loopexit1 ]
  %scevgep27 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4998
  %92 = add nuw nsw i64 %indvars.iv4998, 1
  %scevgep29 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %92
  %93 = bitcast double* %scevgep29 to i8*
  %94 = bitcast double* %scevgep27 to i8*
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %.preheader1, %..preheader1_crit_edge
  %indvars.iv4595 = phi i64 [ 0, %..preheader1_crit_edge ], [ %indvars.iv.next46, %.preheader1 ]
  %95 = mul nuw nsw i64 %indvars.iv4595, 16000
  %scevgep = getelementptr i8, i8* %62, i64 %95
  %96 = add nuw nsw i64 %95, 16000
  %scevgep26 = getelementptr i8, i8* %62, i64 %96
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4595, i64 %indvars.iv4998
  %bound0 = icmp ult i8* %scevgep, %93
  %bound1 = icmp ult i8* %94, %scevgep26
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %97 to i8*
  %bc31 = bitcast double* %97 to i8*
  %bound032 = icmp ult i8* %scevgep, %bc31
  %bound133 = icmp ult i8* %bc, %scevgep26
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  br i1 %conflict.rdx, label %scalar.ph23.preheader, label %vector.body21.preheader

vector.body21.preheader:                          ; preds = %.lr.ph93
  br label %vector.body21

scalar.ph23.preheader:                            ; preds = %.lr.ph93
  br label %scalar.ph23

vector.body21:                                    ; preds = %vector.body21, %vector.body21.preheader
  %index36 = phi i64 [ 0, %vector.body21.preheader ], [ %index.next37, %vector.body21 ]
  %98 = or i64 %index36, 1
  %99 = or i64 %index36, 2
  %100 = or i64 %index36, 3
  %101 = load double, double* %97, align 8, !alias.scope !9
  %102 = insertelement <2 x double> undef, double %101, i32 0
  %103 = shufflevector <2 x double> %102, <2 x double> undef, <2 x i32> zeroinitializer
  %104 = insertelement <2 x double> undef, double %101, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index36, i64 %indvars.iv4998
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %98, i64 %indvars.iv4998
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %99, i64 %indvars.iv4998
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %100, i64 %indvars.iv4998
  %110 = load double, double* %106, align 8, !alias.scope !12
  %111 = load double, double* %107, align 8, !alias.scope !12
  %112 = load double, double* %108, align 8, !alias.scope !12
  %113 = load double, double* %109, align 8, !alias.scope !12
  %114 = insertelement <2 x double> undef, double %110, i32 0
  %115 = insertelement <2 x double> %114, double %111, i32 1
  %116 = insertelement <2 x double> undef, double %112, i32 0
  %117 = insertelement <2 x double> %116, double %113, i32 1
  %118 = fmul <2 x double> %103, %115
  %119 = fmul <2 x double> %105, %117
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv4595, i64 %index36
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !14, !noalias !16
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !14, !noalias !16
  %124 = fadd <2 x double> %118, %wide.load
  %125 = fadd <2 x double> %119, %wide.load44
  %126 = bitcast double* %120 to <2 x double>*
  store <2 x double> %124, <2 x double>* %126, align 8, !alias.scope !14, !noalias !16
  %127 = bitcast double* %122 to <2 x double>*
  store <2 x double> %125, <2 x double>* %127, align 8, !alias.scope !14, !noalias !16
  %index.next37 = add nuw nsw i64 %index36, 4
  %128 = icmp eq i64 %index.next37, 2000
  br i1 %128, label %.preheader1.loopexit78, label %vector.body21, !llvm.loop !17

scalar.ph23:                                      ; preds = %scalar.ph23, %scalar.ph23.preheader
  %indvars.iv4192 = phi i64 [ 0, %scalar.ph23.preheader ], [ %indvars.iv.next42.1, %scalar.ph23 ]
  %129 = load double, double* %97, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4192, i64 %indvars.iv4998
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv4595, i64 %indvars.iv4192
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  store double %135, double* %133, align 8
  %indvars.iv.next42 = or i64 %indvars.iv4192, 1
  %136 = load double, double* %97, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next42, i64 %indvars.iv4998
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %90, i64 0, i64 %indvars.iv4595, i64 %indvars.iv.next42
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  store double %142, double* %140, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv4192, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next42.1, 2000
  br i1 %exitcond.1, label %.preheader1.loopexit, label %scalar.ph23, !llvm.loop !18

.preheader1.loopexit:                             ; preds = %scalar.ph23
  br label %.preheader1

.preheader1.loopexit78:                           ; preds = %vector.body21
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit78, %.preheader1.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4595, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond80, label %.loopexit1, label %.lr.ph93

.loopexit1:                                       ; preds = %.preheader1
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv4998, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond75, label %.preheader..preheader83_crit_edge.preheader, label %..preheader1_crit_edge

.preheader..preheader83_crit_edge.preheader:      ; preds = %.loopexit1
  %143 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %144 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %145 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %146 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %147 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %148 = bitcast i8* %62 to [2000 x [2000 x double]]*
  %149 = bitcast i8* %62 to [2000 x [2000 x double]]*
  br label %.preheader..preheader83_crit_edge

.preheader..preheader83_crit_edge:                ; preds = %.preheader, %.preheader..preheader83_crit_edge.preheader
  %indvars.iv3989 = phi i64 [ 0, %.preheader..preheader83_crit_edge.preheader ], [ %indvars.iv.next40, %.preheader ]
  %scevgep50 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 0
  %scevgep5051 = bitcast double* %scevgep50 to i8*
  %150 = add nuw nsw i64 %indvars.iv3989, 1
  %scevgep52 = getelementptr [2000 x double], [2000 x double]* %0, i64 %150, i64 0
  %scevgep5253 = bitcast double* %scevgep52 to i8*
  %151 = mul nuw nsw i64 %indvars.iv3989, 16000
  %scevgep54 = getelementptr i8, i8* %62, i64 %151
  %152 = add nuw nsw i64 %151, 16000
  %scevgep55 = getelementptr i8, i8* %62, i64 %152
  %bound056 = icmp ult i8* %scevgep5051, %scevgep55
  %bound157 = icmp ult i8* %scevgep54, %scevgep5253
  %memcheck.conflict59 = and i1 %bound056, %bound157
  br i1 %memcheck.conflict59, label %.preheader83.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %.preheader..preheader83_crit_edge
  br label %vector.body45

.preheader83.preheader:                           ; preds = %.preheader..preheader83_crit_edge
  br label %.preheader83

vector.body45:                                    ; preds = %vector.body45, %vector.body45.preheader
  %index62 = phi i64 [ 0, %vector.body45.preheader ], [ %index.next63.1, %vector.body45 ]
  %153 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %148, i64 0, i64 %indvars.iv3989, i64 %index62
  %154 = bitcast double* %153 to <2 x i64>*
  %wide.load70 = load <2 x i64>, <2 x i64>* %154, align 8, !alias.scope !19
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x i64>*
  %wide.load71 = load <2 x i64>, <2 x i64>* %156, align 8, !alias.scope !19
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %index62
  %158 = bitcast double* %157 to <2 x i64>*
  store <2 x i64> %wide.load70, <2 x i64>* %158, align 8, !alias.scope !22, !noalias !19
  %159 = getelementptr double, double* %157, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  store <2 x i64> %wide.load71, <2 x i64>* %160, align 8, !alias.scope !22, !noalias !19
  %index.next63 = or i64 %index62, 4
  %161 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %149, i64 0, i64 %indvars.iv3989, i64 %index.next63
  %162 = bitcast double* %161 to <2 x i64>*
  %wide.load70.1 = load <2 x i64>, <2 x i64>* %162, align 8, !alias.scope !19
  %163 = getelementptr double, double* %161, i64 2
  %164 = bitcast double* %163 to <2 x i64>*
  %wide.load71.1 = load <2 x i64>, <2 x i64>* %164, align 8, !alias.scope !19
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %index.next63
  %166 = bitcast double* %165 to <2 x i64>*
  store <2 x i64> %wide.load70.1, <2 x i64>* %166, align 8, !alias.scope !22, !noalias !19
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x i64>*
  store <2 x i64> %wide.load71.1, <2 x i64>* %168, align 8, !alias.scope !22, !noalias !19
  %index.next63.1 = add nsw i64 %index62, 8
  %169 = icmp eq i64 %index.next63.1, 2000
  br i1 %169, label %.preheader.loopexit77, label %vector.body45, !llvm.loop !24

.preheader83:                                     ; preds = %.preheader83, %.preheader83.preheader
  %indvars.iv88 = phi i64 [ 0, %.preheader83.preheader ], [ %indvars.iv.next.4, %.preheader83 ]
  %170 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %143, i64 0, i64 %indvars.iv3989, i64 %indvars.iv88
  %171 = bitcast double* %170 to i64*
  %172 = load i64, i64* %171, align 8
  %173 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %indvars.iv88
  %174 = bitcast double* %173 to i64*
  store i64 %172, i64* %174, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv88, 1
  %175 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %144, i64 0, i64 %indvars.iv3989, i64 %indvars.iv.next
  %176 = bitcast double* %175 to i64*
  %177 = load i64, i64* %176, align 8
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %indvars.iv.next
  %179 = bitcast double* %178 to i64*
  store i64 %177, i64* %179, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv88, 2
  %180 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %145, i64 0, i64 %indvars.iv3989, i64 %indvars.iv.next.1
  %181 = bitcast double* %180 to i64*
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %indvars.iv.next.1
  %184 = bitcast double* %183 to i64*
  store i64 %182, i64* %184, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv88, 3
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv3989, i64 %indvars.iv.next.2
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %indvars.iv.next.2
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv88, 4
  %190 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %147, i64 0, i64 %indvars.iv3989, i64 %indvars.iv.next.3
  %191 = bitcast double* %190 to i64*
  %192 = load i64, i64* %191, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3989, i64 %indvars.iv.next.3
  %194 = bitcast double* %193 to i64*
  store i64 %192, i64* %194, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv88, 5
  %exitcond79.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond79.4, label %.preheader.loopexit, label %.preheader83, !llvm.loop !25

.preheader.loopexit:                              ; preds = %.preheader83
  br label %.preheader

.preheader.loopexit77:                            ; preds = %vector.body45
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit77, %.preheader.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv3989, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond74, label %.loopexit, label %.preheader..preheader83_crit_edge

.loopexit:                                        ; preds = %.preheader
  call void @free(i8* %62) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
..preheader70_crit_edge.lr.ph:
  br label %..preheader70_crit_edge

..preheader70_crit_edge:                          ; preds = %.loopexit4, %..preheader70_crit_edge.lr.ph
  %indvars.iv68117 = phi i64 [ 0, %..preheader70_crit_edge.lr.ph ], [ %indvars.iv.next69, %.loopexit4 ]
  %cond = icmp eq i64 %indvars.iv68117, 0
  br i1 %cond, label %.lr.ph116.preheader, label %.lr.ph106.preheader

.lr.ph106.preheader:                              ; preds = %..preheader70_crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 0
  br label %.lr.ph106

.lr.ph116.preheader.loopexit:                     ; preds = %.preheader70
  br label %.lr.ph116.preheader

.lr.ph116.preheader:                              ; preds = %.lr.ph116.preheader.loopexit, %..preheader70_crit_edge
  %exitcond61107 = icmp eq i64 %indvars.iv68117, 0
  %xtraiter25 = and i64 %indvars.iv68117, 1
  %lcmp.mod26 = icmp eq i64 %xtraiter25, 0
  %5 = icmp eq i64 %indvars.iv68117, 1
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 0
  br label %.lr.ph116

.lr.ph106:                                        ; preds = %.preheader70, %.lr.ph106.preheader
  %indvars.iv54104 = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next55, %.preheader70 ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv54104
  %8 = load double, double* %7, align 8
  %exitcond5397 = icmp eq i64 %indvars.iv54104, 0
  br i1 %exitcond5397, label %.preheader70, label %.lr.ph100.preheader

.lr.ph100.preheader:                              ; preds = %.lr.ph106
  %xtraiter22 = and i64 %indvars.iv54104, 1
  %lcmp.mod23 = icmp eq i64 %xtraiter22, 0
  br i1 %lcmp.mod23, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.preheader
  %9 = load double, double* %4, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv54104
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %8, %12
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.prol, %.lr.ph100.preheader
  %.lcssa16.unr.ph = phi double [ %13, %.lr.ph100.prol ], [ undef, %.lr.ph100.preheader ]
  %.unr24.ph = phi double [ %13, %.lr.ph100.prol ], [ %8, %.lr.ph100.preheader ]
  %indvars.iv98.unr.ph = phi i64 [ 1, %.lr.ph100.prol ], [ 0, %.lr.ph100.preheader ]
  %14 = icmp eq i64 %indvars.iv54104, 1
  br i1 %14, label %.preheader70, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %15 = phi double [ %.unr24.ph, %.lr.ph100.preheader.new ], [ %27, %.lr.ph100 ]
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr.ph, %.lr.ph100.preheader.new ], [ %indvars.iv.next.1, %.lr.ph100 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv98
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv54104
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  %indvars.iv.next = add nuw nsw i64 %indvars.iv98, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv54104
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  %indvars.iv.next.1 = add nsw i64 %indvars.iv98, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv54104
  br i1 %exitcond53.1, label %.preheader70.loopexit, label %.lr.ph100

.preheader70.loopexit:                            ; preds = %.lr.ph100
  br label %.preheader70

.preheader70:                                     ; preds = %.preheader70.loopexit, %.lr.ph100.prol.loopexit, %.lr.ph106
  %.lcssa76 = phi double [ %8, %.lr.ph106 ], [ %.lcssa16.unr.ph, %.lr.ph100.prol.loopexit ], [ %27, %.preheader70.loopexit ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv54104, i64 %indvars.iv54104
  %29 = load double, double* %28, align 8
  %30 = fdiv double %.lcssa76, %29
  store double %30, double* %7, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54104, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next55, %indvars.iv68117
  br i1 %exitcond58, label %.lr.ph116.preheader.loopexit, label %.lr.ph106

.lr.ph116:                                        ; preds = %.preheader, %.lr.ph116.preheader
  %indvars.iv64114 = phi i64 [ %indvars.iv68117, %.lr.ph116.preheader ], [ %indvars.iv.next65, %.preheader ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv64114
  %32 = load double, double* %31, align 8
  br i1 %exitcond61107, label %.preheader, label %.lr.ph110.preheader

.lr.ph110.preheader:                              ; preds = %.lr.ph116
  br i1 %lcmp.mod26, label %.lr.ph110.prol.loopexit, label %.lr.ph110.prol

.lr.ph110.prol:                                   ; preds = %.lr.ph110.preheader
  %33 = load double, double* %6, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64114
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %32, %36
  br label %.lr.ph110.prol.loopexit

.lr.ph110.prol.loopexit:                          ; preds = %.lr.ph110.prol, %.lr.ph110.preheader
  %.lcssa17.unr.ph = phi double [ %37, %.lr.ph110.prol ], [ undef, %.lr.ph110.preheader ]
  %.unr27.ph = phi double [ %37, %.lr.ph110.prol ], [ %32, %.lr.ph110.preheader ]
  %indvars.iv34108.unr.ph = phi i64 [ 1, %.lr.ph110.prol ], [ 0, %.lr.ph110.preheader ]
  br i1 %5, label %.preheader, label %.lr.ph110.preheader.new

.lr.ph110.preheader.new:                          ; preds = %.lr.ph110.prol.loopexit
  br label %.lr.ph110

.lr.ph110:                                        ; preds = %.lr.ph110, %.lr.ph110.preheader.new
  %38 = phi double [ %.unr27.ph, %.lr.ph110.preheader.new ], [ %50, %.lr.ph110 ]
  %indvars.iv34108 = phi i64 [ %indvars.iv34108.unr.ph, %.lr.ph110.preheader.new ], [ %indvars.iv.next35.1, %.lr.ph110 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv34108
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34108, i64 %indvars.iv64114
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34108, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68117, i64 %indvars.iv.next35
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next35, i64 %indvars.iv64114
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34108, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next35.1, %indvars.iv68117
  br i1 %exitcond61.1, label %.preheader.loopexit, label %.lr.ph110

.preheader.loopexit:                              ; preds = %.lr.ph110
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph110.prol.loopexit, %.lr.ph116
  %.lcssa77 = phi double [ %32, %.lr.ph116 ], [ %.lcssa17.unr.ph, %.lr.ph110.prol.loopexit ], [ %50, %.preheader.loopexit ]
  store double %.lcssa77, double* %31, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64114, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond74, label %.loopexit4, label %.lr.ph116

.loopexit4:                                       ; preds = %.preheader
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68117, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next69, 2000
  br i1 %exitcond13, label %.lr.ph95.preheader, label %..preheader70_crit_edge

.lr.ph95.preheader:                               ; preds = %.loopexit4
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %.loopexit2, %.lr.ph95.preheader
  %indvars.iv4993 = phi i64 [ 0, %.lr.ph95.preheader ], [ %indvars.iv.next50, %.loopexit2 ]
  %51 = add i64 %indvars.iv4993, -1
  %52 = getelementptr inbounds double, double* %1, i64 %indvars.iv4993
  %53 = load double, double* %52, align 8
  %exitcond87 = icmp eq i64 %indvars.iv4993, 0
  br i1 %exitcond87, label %.loopexit2, label %.lr.ph90.preheader

.lr.ph90.preheader:                               ; preds = %.lr.ph95
  %xtraiter18 = and i64 %indvars.iv4993, 3
  %lcmp.mod19 = icmp eq i64 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.lr.ph90.prol.loopexit, label %.lr.ph90.prol.preheader

.lr.ph90.prol.preheader:                          ; preds = %.lr.ph90.preheader
  br label %.lr.ph90.prol

.lr.ph90.prol:                                    ; preds = %.lr.ph90.prol, %.lr.ph90.prol.preheader
  %54 = phi double [ %53, %.lr.ph90.prol.preheader ], [ %60, %.lr.ph90.prol ]
  %indvars.iv4588.prol = phi i64 [ 0, %.lr.ph90.prol.preheader ], [ %indvars.iv.next46.prol, %.lr.ph90.prol ]
  %prol.iter20 = phi i64 [ %xtraiter18, %.lr.ph90.prol.preheader ], [ %prol.iter20.sub, %.lr.ph90.prol ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4993, i64 %indvars.iv4588.prol
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv4588.prol
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %54, %59
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv4588.prol, 1
  %prol.iter20.sub = add i64 %prol.iter20, -1
  %prol.iter20.cmp = icmp eq i64 %prol.iter20.sub, 0
  br i1 %prol.iter20.cmp, label %.lr.ph90.prol.loopexit.loopexit, label %.lr.ph90.prol, !llvm.loop !26

.lr.ph90.prol.loopexit.loopexit:                  ; preds = %.lr.ph90.prol
  br label %.lr.ph90.prol.loopexit

.lr.ph90.prol.loopexit:                           ; preds = %.lr.ph90.prol.loopexit.loopexit, %.lr.ph90.preheader
  %.lcssa15.unr = phi double [ undef, %.lr.ph90.preheader ], [ %60, %.lr.ph90.prol.loopexit.loopexit ]
  %.unr21 = phi double [ %53, %.lr.ph90.preheader ], [ %60, %.lr.ph90.prol.loopexit.loopexit ]
  %indvars.iv4588.unr = phi i64 [ 0, %.lr.ph90.preheader ], [ %indvars.iv.next46.prol, %.lr.ph90.prol.loopexit.loopexit ]
  %61 = icmp ult i64 %51, 3
  br i1 %61, label %.loopexit2, label %.lr.ph90.preheader.new

.lr.ph90.preheader.new:                           ; preds = %.lr.ph90.prol.loopexit
  br label %.lr.ph90

.lr.ph90:                                         ; preds = %.lr.ph90, %.lr.ph90.preheader.new
  %62 = phi double [ %.unr21, %.lr.ph90.preheader.new ], [ %86, %.lr.ph90 ]
  %indvars.iv4588 = phi i64 [ %indvars.iv4588.unr, %.lr.ph90.preheader.new ], [ %indvars.iv.next46.3, %.lr.ph90 ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4993, i64 %indvars.iv4588
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv4588
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %62, %67
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4588, 1
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4993, i64 %indvars.iv.next46
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next46
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %68, %73
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv4588, 2
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4993, i64 %indvars.iv.next46.1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next46.1
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %74, %79
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv4588, 3
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4993, i64 %indvars.iv.next46.2
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next46.2
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv4588, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next46.3, %indvars.iv4993
  br i1 %exitcond.3, label %.loopexit2.loopexit, label %.lr.ph90

.loopexit2.loopexit:                              ; preds = %.lr.ph90
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %.lr.ph90.prol.loopexit, %.lr.ph95
  %.lcssa75 = phi double [ %53, %.lr.ph95 ], [ %.lcssa15.unr, %.lr.ph90.prol.loopexit ], [ %86, %.loopexit2.loopexit ]
  %87 = getelementptr inbounds double, double* %3, i64 %indvars.iv4993
  store double %.lcssa75, double* %87, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv4993, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond120, label %.lr.ph85.preheader, label %.lr.ph95

.lr.ph85.preheader:                               ; preds = %.loopexit2
  br label %.lr.ph85

.lr.ph85:                                         ; preds = %.loopexit, %.lr.ph85.preheader
  %indvars.iv3983 = phi i64 [ 2000, %.lr.ph85.preheader ], [ %indvars.iv.next40, %.loopexit ]
  %indvars.iv4381 = phi i64 [ 1999, %.lr.ph85.preheader ], [ %indvars.iv.next44, %.loopexit ]
  %sext = shl i64 %indvars.iv3983, 32
  %88 = ashr exact i64 %sext, 32
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv4381
  %90 = load double, double* %89, align 8
  %91 = icmp slt i64 %sext, 8589934592000
  br i1 %91, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.lr.ph85
  %92 = sub nsw i64 1999, %88
  %93 = sub nsw i64 0, %88
  %xtraiter = and i64 %93, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %94 = phi double [ %90, %.lr.ph.prol.preheader ], [ %100, %.lr.ph.prol ]
  %indvars.iv4178.prol = phi i64 [ %88, %.lr.ph.prol.preheader ], [ %indvars.iv.next42.prol, %.lr.ph.prol ]
  %prol.iter = phi i64 [ %xtraiter, %.lr.ph.prol.preheader ], [ %prol.iter.sub, %.lr.ph.prol ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv4178.prol
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %2, i64 %indvars.iv4178.prol
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fsub double %94, %99
  %indvars.iv.next42.prol = add nsw i64 %indvars.iv4178.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !27

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa14.unr = phi double [ undef, %.lr.ph.preheader ], [ %100, %.lr.ph.prol.loopexit.loopexit ]
  %.unr = phi double [ %90, %.lr.ph.preheader ], [ %100, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv4178.unr = phi i64 [ %88, %.lr.ph.preheader ], [ %indvars.iv.next42.prol, %.lr.ph.prol.loopexit.loopexit ]
  %101 = icmp ult i64 %92, 3
  br i1 %101, label %.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %102 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %126, %.lr.ph ]
  %indvars.iv4178 = phi i64 [ %indvars.iv4178.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next42.3, %.lr.ph ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv4178
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %2, i64 %indvars.iv4178
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fsub double %102, %107
  %indvars.iv.next42 = add nsw i64 %indvars.iv4178, 1
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv.next42
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next42
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fsub double %108, %113
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv4178, 2
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv.next42.1
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next42.1
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fsub double %114, %119
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv4178, 3
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv.next42.2
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next42.2
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %120, %125
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv4178, 4
  %exitcond119.3 = icmp eq i64 %indvars.iv.next42.3, 2000
  br i1 %exitcond119.3, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %.lr.ph85
  %.lcssa = phi double [ %90, %.lr.ph85 ], [ %.lcssa14.unr, %.lr.ph.prol.loopexit ], [ %126, %.loopexit.loopexit ]
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4381, i64 %indvars.iv4381
  %128 = load double, double* %127, align 8
  %129 = fdiv double %.lcssa, %128
  %130 = getelementptr inbounds double, double* %2, i64 %indvars.iv4381
  store double %129, double* %130, align 8
  %indvars.iv.next44 = add nsw i64 %indvars.iv4381, -1
  %indvars.iv.next40 = add nsw i64 %88, -1
  %131 = icmp sgt i64 %indvars.iv4381, 0
  br i1 %131, label %.lr.ph85, label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.loopexit, label %5

.loopexit:                                        ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !4, !5}
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !2}
