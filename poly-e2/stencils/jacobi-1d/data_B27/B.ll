; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %6 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, %div.v.i1.2
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %0
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %tsteps, 0
  br i1 %cmp8, label %for.body.lr.ph, label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub1 = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub1, 1
  br i1 %cmp22, label %for.body.us.preheader, label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %0 = sext i32 %n to i64
  %sub = add nsw i64 %0, -1
  %xtraiter = and i32 %n, 1
  %wide.trip.count.1 = zext i32 %sub1 to i64
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %1 = add nsw i64 %wide.trip.count.1, -2
  %scevgep112 = getelementptr double, double* %A, i64 2
  %scevgep115 = getelementptr double, double* %B, i64 -1
  %scevgep118 = getelementptr double, double* %B, i64 3
  %2 = add nsw i64 %0, -2
  %scevgep156 = getelementptr double, double* %B, i64 %sub
  %scevgep158 = getelementptr double, double* %A, i64 %0
  %3 = add nsw i64 %0, 1
  %min.iters.check149 = icmp ult i64 %2, 4
  %4 = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %n, 3
  %sunkaddr = ptrtoint double* %B to i64
  %sunkaddr183 = add i64 %sunkaddr, 8
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  %sunkaddr186 = add i64 %sunkaddr, 16
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to double*
  %sunkaddr188 = ptrtoint double* %A to i64
  %sunkaddr189 = add i64 %sunkaddr188, 8
  %sunkaddr190 = inttoptr i64 %sunkaddr189 to double*
  %n.vec152 = and i64 %2, -4
  %cmp.zero153 = icmp eq i64 %n.vec152, 0
  %bound0160 = icmp ult double* %arrayidx21.us.prol, %scevgep158
  %bound1161 = icmp ugt double* %scevgep156, %A
  %found.conflict162 = and i1 %bound0160, %bound1161
  %ind.end169 = or i64 %n.vec152, 1
  %cmp.n170 = icmp eq i64 %2, %n.vec152
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us, %for.body.us.preheader
  %inc3411.us = phi i32 [ 0, %for.body.us.preheader ], [ %inc34.us, %for.inc33.us ]
  br i1 %min.iters.check149, label %for.inc.us.preheader, label %min.iters.checked150

for.inc.us.preheader:                             ; preds = %middle.block147, %vector.memcheck164, %min.iters.checked150, %for.body.us
  %indvars.iv.ph = phi i64 [ %ind.end169, %middle.block147 ], [ 1, %vector.memcheck164 ], [ 1, %min.iters.checked150 ], [ 1, %for.body.us ]
  %6 = sub nsw i64 %3, %indvars.iv.ph
  %xtraiter191 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter191, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  %7 = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.us.prol = getelementptr inbounds double, double* %A, i64 %7
  %8 = load double, double* %arrayidx.us.prol, align 8
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %9 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %8, %9
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %10 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %10
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.us.preheader, %for.inc.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol.preheader ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %11 = icmp eq i64 %2, %indvars.iv.ph
  br i1 %11, label %for.inc30.us.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

min.iters.checked150:                             ; preds = %for.body.us
  br i1 %cmp.zero153, label %for.inc.us.preheader, label %vector.memcheck164

vector.memcheck164:                               ; preds = %min.iters.checked150
  br i1 %found.conflict162, label %for.inc.us.preheader, label %vector.body146.preheader

vector.body146.preheader:                         ; preds = %vector.memcheck164
  br label %vector.body146

vector.body146:                                   ; preds = %vector.body146.preheader, %vector.body146
  %index166 = phi i64 [ %index.next167, %vector.body146 ], [ 0, %vector.body146.preheader ]
  %offset.idx171 = or i64 %index166, 1
  %12 = getelementptr inbounds double, double* %A, i64 %index166
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load176 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds double, double* %A, i64 %offset.idx171
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load177 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load178 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %wide.load, %wide.load177
  %21 = fadd <2 x double> %wide.load176, %wide.load178
  %22 = add nuw nsw i64 %offset.idx171, 1
  %23 = getelementptr inbounds double, double* %A, i64 %22
  %24 = getelementptr double, double* %23, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load180 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %20, %wide.load176
  %27 = fadd <2 x double> %21, %wide.load180
  %28 = fmul <2 x double> %26, <double 3.333300e-01, double 3.333300e-01>
  %29 = fmul <2 x double> %27, <double 3.333300e-01, double 3.333300e-01>
  %30 = getelementptr inbounds double, double* %B, i64 %offset.idx171
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> %28, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> %29, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next167 = add i64 %index166, 4
  %34 = icmp eq i64 %index.next167, %n.vec152
  br i1 %34, label %middle.block147, label %vector.body146, !llvm.loop !6

middle.block147:                                  ; preds = %vector.body146
  br i1 %cmp.n170, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block102, %for.inc30.us.prol.loopexit
  %inc34.us = add nsw i32 %inc3411.us, 1
  %cmp.us = icmp slt i32 %inc34.us, %tsteps
  br i1 %cmp.us, label %for.body.us, label %for.end35.loopexit

for.inc30.us:                                     ; preds = %for.inc30.us.preheader182, %for.inc30.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc30.us ], [ %indvars.iv63.ph, %for.inc30.us.preheader182 ]
  %35 = add nsw i64 %indvars.iv63, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %35
  %36 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv63
  %37 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %36, %37
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64
  %38 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %38
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv63
  store double %mul27.us, double* %arrayidx29.us, align 8
  %39 = load double, double* %arrayidx21.us, align 8
  %40 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %39, %40
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64.1
  %41 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %41
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next64
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next64.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc33.us.loopexit, label %for.inc30.us, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %42 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %42
  %43 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %44 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %43, %44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %45 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %45
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %46 = load double, double* %arrayidx6.us, align 8
  %47 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %46, %47
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %48 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %48
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1192 = icmp eq i64 %indvars.iv.next.1, %sub
  br i1 %exitcond.1192, label %for.inc30.us.preheader.loopexit.unr-lcssa, label %for.inc.us, !llvm.loop !10

for.inc30.us.preheader.loopexit.unr-lcssa:        ; preds = %for.inc.us
  br label %for.inc30.us.preheader.loopexit

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us.prol.loopexit.unr-lcssa, %for.inc30.us.preheader.loopexit.unr-lcssa
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %middle.block147
  br i1 %4, label %for.inc30.us.prol.loopexit, label %for.inc30.us.prol

for.inc30.us.prol:                                ; preds = %for.inc30.us.preheader
  %49 = load double, double* %B, align 8
  %50 = load double, double* %sunkaddr184, align 8
  %add22.us.prol = fadd double %49, %50
  %51 = load double, double* %sunkaddr187, align 8
  %add26.us.prol = fadd double %add22.us.prol, %51
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %sunkaddr190, align 8
  br label %for.inc30.us.prol.loopexit

for.inc30.us.prol.loopexit:                       ; preds = %for.inc30.us.preheader, %for.inc30.us.prol
  %indvars.iv63.unr.ph = phi i64 [ 2, %for.inc30.us.prol ], [ 1, %for.inc30.us.preheader ]
  br i1 %5, label %for.inc33.us, label %for.inc30.us.preheader80

for.inc30.us.preheader80:                         ; preds = %for.inc30.us.prol.loopexit
  %52 = sub nsw i64 %1, %indvars.iv63.unr.ph
  %53 = lshr i64 %52, 1
  %54 = add nuw i64 %53, 1
  %min.iters.check104 = icmp ult i64 %54, 2
  br i1 %min.iters.check104, label %for.inc30.us.preheader182, label %min.iters.checked105

for.inc30.us.preheader182:                        ; preds = %middle.block102, %vector.memcheck125, %min.iters.checked105, %for.inc30.us.preheader80
  %indvars.iv63.ph = phi i64 [ %ind.end130, %middle.block102 ], [ %indvars.iv63.unr.ph, %vector.memcheck125 ], [ %indvars.iv63.unr.ph, %min.iters.checked105 ], [ %indvars.iv63.unr.ph, %for.inc30.us.preheader80 ]
  br label %for.inc30.us

min.iters.checked105:                             ; preds = %for.inc30.us.preheader80
  %n.mod.vf106 = and i64 %54, 1
  %n.vec107 = sub i64 %54, %n.mod.vf106
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  br i1 %cmp.zero108, label %for.inc30.us.preheader182, label %vector.memcheck125

vector.memcheck125:                               ; preds = %min.iters.checked105
  %scevgep110 = getelementptr double, double* %A, i64 %indvars.iv63.unr.ph
  %55 = shl nuw i64 %53, 1
  %56 = add i64 %indvars.iv63.unr.ph, %55
  %scevgep113 = getelementptr double, double* %scevgep112, i64 %56
  %scevgep116 = getelementptr double, double* %scevgep115, i64 %indvars.iv63.unr.ph
  %scevgep119 = getelementptr double, double* %scevgep118, i64 %56
  %bound0121 = icmp ult double* %scevgep110, %scevgep119
  %bound1122 = icmp ult double* %scevgep116, %scevgep113
  %found.conflict123 = and i1 %bound0121, %bound1122
  %57 = add nuw nsw i64 %indvars.iv63.unr.ph, 2
  %58 = add i64 %57, %55
  %59 = shl nuw nsw i64 %n.mod.vf106, 1
  %ind.end130 = sub i64 %58, %59
  br i1 %found.conflict123, label %for.inc30.us.preheader182, label %vector.body101.preheader

vector.body101.preheader:                         ; preds = %vector.memcheck125
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101.preheader, %vector.body101
  %index127 = phi i64 [ %index.next128, %vector.body101 ], [ 0, %vector.body101.preheader ]
  %60 = shl i64 %index127, 1
  %offset.idx132 = or i64 %indvars.iv63.unr.ph, %60
  %61 = add nsw i64 %offset.idx132, -1
  %62 = getelementptr inbounds double, double* %B, i64 %61
  %63 = bitcast double* %62 to <4 x double>*
  %wide.vec136 = load <4 x double>, <4 x double>* %63, align 8, !alias.scope !11
  %strided.vec137 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %64 = fadd <2 x double> %strided.vec137, %strided.vec138
  %65 = add nuw nsw i64 %offset.idx132, 1
  %66 = getelementptr inbounds double, double* %B, i64 %65
  %67 = getelementptr double, double* %66, i64 -1
  %68 = bitcast double* %67 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %68, align 8, !alias.scope !11
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %69 = fadd <2 x double> %64, %strided.vec141
  %70 = fmul <2 x double> %69, <double 3.333300e-01, double 3.333300e-01>
  %71 = bitcast double* %66 to <4 x double>*
  %wide.vec142 = load <4 x double>, <4 x double>* %71, align 8, !alias.scope !11
  %strided.vec144 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %72 = fadd <4 x double> %wide.vec139, %wide.vec142
  %73 = shufflevector <4 x double> %72, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %74 = fadd <2 x double> %73, %strided.vec144
  %75 = fmul <2 x double> %74, <double 3.333300e-01, double 3.333300e-01>
  %76 = getelementptr inbounds double, double* %A, i64 %65
  %77 = getelementptr double, double* %76, i64 -1
  %78 = bitcast double* %77 to <4 x double>*
  %interleaved.vec145 = shufflevector <2 x double> %70, <2 x double> %75, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec145, <4 x double>* %78, align 8, !alias.scope !14, !noalias !11
  %index.next128 = add i64 %index127, 2
  %79 = icmp eq i64 %index.next128, %n.vec107
  br i1 %79, label %middle.block102, label %vector.body101, !llvm.loop !16

middle.block102:                                  ; preds = %vector.body101
  %cmp.n131 = icmp eq i64 %n.mod.vf106, 0
  br i1 %cmp.n131, label %for.inc33.us, label %for.inc30.us.preheader182

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.body.lr.ph, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
